import 'package:flutter/material.dart';

// Import statements for detail product pages
import 'DPI1.dart';
import 'DPI2.dart';
import 'DPI3.dart';
import 'DPI4.dart';
import 'DPI5.dart';
import 'DPI6.dart';
import 'DPI7.dart';
import 'DPI8.dart';
import 'Keranjangi1.dart'; // Tambahkan ini untuk mengimpor halaman KeranjangPage

class Fitur2Page extends StatefulWidget {
  @override
  _Fitur2PageState createState() => _Fitur2PageState();
}

class _Fitur2PageState extends State<Fitur2Page> {
  String searchKeyword = '';
  List<int> filteredProductIndexes = List.generate(8, (index) => index);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchKeyword = value;
                        filterProducts();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari produk',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Keranjangi1Page(
                          quantityy: 1, // Ganti dengan nilai yang sesuai
                          totalPricee: 42000, // Ganti dengan nilai yang sesuai
                        ),
                      ), // Mengubah halaman tujuan menjadi KeranjangPage
                    );
                  },
                ),
              ],
            ),
          ),
          backgroundColor: const Color.fromARGB(0, 252, 250, 250),
          elevation: 0.0,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Terkait'),
              Tab(text: 'Terbaru'),
              Tab(text: 'Terlaris'),
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[300]!,
                  Colors.blue[700]!,
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildProductGridView(1),
            buildProductGridView(2),
            buildProductGridView(3),
          ],
        ),
      ),
    );
  }

  Widget buildProductGridView(int category) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: filteredProductIndexes.map((index) {
          String imagePath = index == 7 ? 'ikan_8.jpg' : 'ikan_${index + 1}.jpg';
          String productName = '';
          double productRating = 0.0;
          int productSold = 0;
          String productPrice = '';
          String deliveryText = '';
          String locationText = '';
          switch (index) {
            case 0:
              productName = 'Ikan Nila';
              productRating = 4.8;
              productSold = 834;
              productPrice = 'Rp 42.000/kg';
              deliveryText = 'Besok Hari';
              locationText = 'Sidoarjo';
              break;
            case 1:
              productName = 'Ikan Lele';
              productRating = 4.6;
              productSold = 520;
              productPrice = 'Rp 34.000';
              deliveryText = '1-2 Hari';
              locationText = 'Gresik';
              break;
            case 2:
              productName = 'Ikan Gurame';
              productRating = 4.7;
              productSold = 756;
              productPrice = 'Rp 50.000/kg';
              deliveryText = 'Besok Hari';
              locationText = 'Surabaya';
              break;
            case 3:
              productName = 'Ikan Patin';
              productRating = 4.5;
              productSold = 389;
              productPrice = 'Rp 33.000/kg';
              deliveryText = '1-2 Hari';
              locationText = 'Kediri';
              break;
            case 4:
              productName = 'Ikan Mas';
              productRating = 4.9;
              productSold = 1023;
              productPrice = 'Rp 60.000/kg';
              deliveryText = '2 Hari';
              locationText = 'Malang';
              break;
            case 5:
              productName = 'Ikan kakap';
              productRating = 4.7;
              productSold = 614;
              productPrice = 'Rp 51.000/kg';
              deliveryText = '1-2 Hari';
              locationText = 'Mojokerto';
              break;
            case 6:
              productName = 'Ikan Mujair';
              productRating = 4.7;
              productSold = 531;
              productPrice = 'Rp 40.000/kg';
              deliveryText = 'Besok Hari';
              locationText = 'Sidoarjo';
              break;
            case 7:
              productName = 'Ikan Bawal';
              productRating = 4.6;
              productSold = 476;
              productPrice = 'Rp 33.000/kg';
              deliveryText = 'Besok Hari';
              locationText = 'Surabaya';
              break;
            default:
              break;
          }
          if (productName.toLowerCase().contains(searchKeyword.toLowerCase())) {
            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DPI1Page()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DPI2Page()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DPI3Page()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DPI4Page()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DPI5Page()),
                    );
                    break;
                  case 5:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DPI6Page()),
                    );
                    break;
                  case 6:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DPI7Page()),
                    );
                    break;
                  case 7:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DPI8Page()),
                    );
                    break;
                  default:
                    break;
                }
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/$imagePath',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 223, 4, 4)
                                    .withOpacity(0.8),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    color: Color.fromARGB(255, 231, 178, 1),
                                    size: 18.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    'COD',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 245, 243, 243),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '$productName',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$productPrice',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 4.0),
                              Text(
                                '$productRating',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                '$productSold terjual',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Icon(Icons.local_shipping,
                                  color: Colors.green, size: 16.0),
                              SizedBox(width: 2.0),
                              Text(
                                '$deliveryText',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 4.0),
                              Icon(Icons.location_on,
                                  color: Colors.red, size: 16.0),
                              SizedBox(width: 2.0),
                              Text(
                                '$locationText',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        }).toList(),
      ),
    );
  }

  void filterProducts() {
    filteredProductIndexes.clear();
    for (int i = 0; i < 8; i++) {
      String productName = '';
      switch (i) {
        case 0:
          productName = 'Ikan Nila';
          break;
        case 1:
          productName = 'Ikan Lele';
          break;
        case 2:
          productName = 'Ikan Gurame';
          break;
        case 3:
          productName = 'Ikan Patin';
          break;
        case 4:
          productName = 'Ikan Mas';
          break;
        case 5:
          productName = 'Ikan Kakap';
          break;
        case 6:
          productName = 'Ikan Mujair';
          break;
        case 7:
          productName = 'Ikan Bawal';
          break;
        default:
          break;
      }
      if (productName.toLowerCase().contains(searchKeyword.toLowerCase())) {
        filteredProductIndexes.add(i);
      }
    }
  }
}
