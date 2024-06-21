import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePageMap(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePageMap extends StatefulWidget {
  const MyHomePageMap({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePageMap> createState() => _MyHomePageMapState();
}

class _MyHomePageMapState extends State<MyHomePageMap> {
  final LatLng upnVeteranLocation =
      LatLng(-7.3346224, 112.7883341); // Lokasi UPN Veteran
  List<Map<String, dynamic>> fishingSpots = [
    {
      'distance': 0.5, // Jarak dalam kilometer (500 meter)
      'angle': 0.0, // Arah dalam radian (0 rad = timur)
      'name': 'Kolam Pancing Bumi Gacar',
    },
    {
      'distance': 0.7, // Jarak dalam kilometer (700 meter)
      'angle': math.pi / 2, // 90 derajat (sebelah selatan)
      'name': 'Kolam Pancing Afika',
    },
    {
      'distance': 0.4, // Jarak dalam kilometer (400 meter)
      'angle': -math.pi / 2, // -90 derajat (sebelah utara)
      'name': 'Kolam Pancing Lele "GAYA"',
    },
    {
      'distance': 0.8, // Jarak dalam kilometer (800 meter)
      'angle': math.pi / 4, // 45 derajat (sebelah tenggara)
      'name': 'Kolam Pancing Abah Taqim Fishing Ponds',
    },
  ];

  LatLng? _selectedSpot; // Titik yang dipilih untuk rute
  bool _isRoutingMode = false; // Status mode rute
  List<LatLng> _routePoints = []; // Titik-titik untuk polyline rute
  bool _showResetRouteButton =
      false; // State untuk menampilkan tombol reset rute

  String _searchQuery = ''; // State untuk nilai dari input pencarian
  bool _isSearching = false; // State untuk menandai status pencarian

  @override
  Widget build(BuildContext context) {
    List<LatLng> calculatedFishingSpots = _filterLocations(_searchQuery);

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: upnVeteranLocation,
              zoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
                additionalOptions: {
                  'attribution': '© OpenStreetMap contributors',
                },
              ),
              if (_isSearching || _selectedSpot != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: upnVeteranLocation,
                      builder: (ctx) => const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                    ...calculatedFishingSpots.asMap().entries.map((entry) {
                      int index = entry.key;
                      LatLng spot = entry.value;
                      return Marker(
                        width: 80.0,
                        height: 80.0,
                        point: spot,
                        builder: (ctx) => GestureDetector(
                          onTap: () {
                            if (!_isRoutingMode) {
                              setState(() {
                                _selectedSpot = spot;
                              });
                              _showBottomSheet(
                                  context, spot, fishingSpots[index]['name']);
                            }
                          },
                          child: Icon(
                            Icons.location_on,
                            color: _selectedSpot == spot
                                ? Colors.blue
                                : Colors.blue,
                            size: 40.0,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              if (_routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    // Blue line (initial straight-line route)
                    Polyline(
                      points: _routePoints,
                      strokeWidth: 3.0,
                      color: Colors.blue,
                    ),
                    // Red line (detailed route)
                    if (_selectedSpot != null)
                      Polyline(
                        points: _routePoints,
                        strokeWidth: 3.0,
                        color: Colors.blue,
                      ),
                  ],
                ),
            ],
          ),
          if (_showResetRouteButton)
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _routePoints.clear();
                    _selectedSpot = null;
                    _isRoutingMode = false;
                    _showResetRouteButton = false;
                  });
                },
                child: Icon(Icons.refresh),
              ),
            ),
          Positioned(
            top: 50.0,
            left: 16.0,
            right: 16.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search fishing spots...',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        onSubmitted: (value) {
                          setState(() {
                            _isSearching = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 110.0,
            left: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }

  List<LatLng> _filterLocations(String query) {
    query = query.toLowerCase();
    return fishingSpots
        .where((spot) => spot['name'].toLowerCase().contains(query))
        .map((spot) {
      double latOffset = spot['distance'] *
          0.008983; // Sekitar 1 derajat latitude atau longitude sekitar 1km di khatulistiwa
      double lngOffset = spot['distance'] *
          0.008983 /
          math.cos(upnVeteranLocation.latitude * math.pi / 180.0);

      return LatLng(
        upnVeteranLocation.latitude + latOffset * math.cos(spot['angle']),
        upnVeteranLocation.longitude + lngOffset * math.sin(spot['angle']),
      );
    }).toList();
  }

  void _showBottomSheet(BuildContext context, LatLng spot, String spotName) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            String imageAsset;
            String description;
            switch (spotName) {
              case 'Kolam Pancing Bumi Gacar':
                imageAsset = 'assets/a.jpg'; // Ganti gambar jika diperlukan
                description =
                    '4.7 \u2605 \u2605 \u2605 \u2605 jarak 450 M'; // Ubah deskripsi sesuai permintaan
                break;
              case 'Kolam Pancing Afika':
                imageAsset = 'assets/b.jpg';
                description =
                    '4.8 \u2605 \u2605 \u2605 \u2605 \u2605 jarak 800 M';
                break;
              case 'Kolam Pancing Lele "GAYA"':
                imageAsset = 'assets/c.jpg';
                description =
                    '4.9 \u2605 \u2605 \u2605 \u2605 \u2605 jarak 300 M';
                break;
              case 'Kolam Pancing Abah Taqim Fishing Ponds':
                imageAsset = 'assets/d.jpg';
                description = '4.7 \u2605 \u2605 \u2605 \u2605 jarak 1 Km';
                break;
              default:
                imageAsset = 'assets/a.jpg'; // Default image for others
                description = 'This is a detailed description of $spotName.';
                break;
            }
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading:
                        Icon(Icons.location_on, color: Colors.blue, size: 40),
                    title: Text(
                      spotName,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description, // Menggunakan deskripsi yang sudah diubah
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(imageAsset),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _isRoutingMode = true;
                            });
                            await _getRoute(upnVeteranLocation, _selectedSpot!);
                            Navigator.pop(
                              context,
                            ); // Tutup bottom sheet setelah tombol Route diklik
                          },
                          child: Text('Route'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      // Ketika bottom sheet ditutup, cek apakah _routePoints sudah terisi
      if (_routePoints.isNotEmpty) {
        setState(() {
          _showResetRouteButton =
              true; // Tampilkan tombol Reset Route di luar bottom sheet
        });
      }
    });
  }

  Future<void> _getRoute(LatLng start, LatLng end) async {
    var url = Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var routes = data['routes'];
      if (routes.isNotEmpty) {
        List<dynamic> geometry = routes[0]['geometry']['coordinates'];
        setState(() {
          _routePoints.clear();
          for (var point in geometry) {
            _routePoints.add(LatLng(point[1], point[0]));
          }
        });
      }
    } else {
      throw Exception('Failed to load route');
    }
  }

  @override
  void initState() {
    super.initState();
    // Load your initial data or perform any initialization here
  }
}
