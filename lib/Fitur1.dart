import 'package:flutter/material.dart';

// Import statements for detail product pages
import 'DP1.dart';
import 'DP2.dart';
import 'DP3.dart';
import 'DP4.dart';
import 'DP5.dart';
import 'DP6.dart';
import 'DP7.dart';
import 'DP8.dart';
import 'Keranjang.dart'; // Tambahkan ini untuk mengimpor halaman KeranjangPage

class Fitur1Page extends StatefulWidget {
  @override
  _Fitur1PageState createState() => _Fitur1PageState();
}

class _Fitur1PageState extends State<Fitur1Page> {
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
                        builder: (context) => KeranjangPage(
                          quantityy: 1, // Ganti dengan nilai yang sesuai
                          totalPricee: 100000, // Ganti dengan nilai yang sesuai
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
          String imagePath = index == 7 ? 'pan.jpg' : '${index + 2}.jpg';
          String productName = '';
          double productRating = 0.0;
          int productSold = 0;
          String productPrice = '';
          String deliveryText = '';
          String locationText = '';
          switch (index) {
            case 0:
              productName = 'Paket Pancing Komplit';
              productRating = 4.8;
              productSold = 534;
              productPrice = 'Rp 350.000';
              deliveryText = 'Besok';
              locationText = 'Surabaya';
              break;
            case 1:
              productName = 'Pancing TRD L300';
              productRating = 4.6;
              productSold = 320;
              productPrice = 'Rp 200.000';
              deliveryText = '1-2 Hari';
              locationText = 'Tanggerang';
              break;
            case 2:
              productName = 'Kail Pancing';
              productRating = 4.7;
              productSold = 456;
              productPrice = 'Rp 40.000';
              deliveryText = '2 Hari';
              locationText = 'Bandung';
              break;
            case 3:
              productName = 'Pancing Kayu';
              productRating = 4.5;
              productSold = 789;
              productPrice = 'Rp 80.000';
              deliveryText = '2-4 Hari';
              locationText = 'Jakarta';
              break;
            case 4:
              productName = 'Pancing Mania';
              productRating = 4.9;
              productSold = 123;
              productPrice = 'Rp 400.000';
              deliveryText = 'Besok Hari';
              locationText = 'Gersik';
              break;
            case 5:
              productName = 'Tabung Pancing';
              productRating = 4.7;
              productSold = 654;
              productPrice = 'Rp 90.000';
              deliveryText = '1-2 Hari';
              locationText = 'Kab.Pasuruan';
              break;
            case 6:
              productName = 'Umpan Pancing';
              productRating = 4.7;
              productSold = 231;
              productPrice = 'Rp 80.000';
              deliveryText = '1-3 Hari';
              locationText = 'Sulawesi';
              break;
            case 7:
              productName = 'Tabung Pancing Variasi';
              productRating = 4.8;
              productSold = 876;
              productPrice = 'Rp 90.000';
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
                      MaterialPageRoute(builder: (context) => DP1Page()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DP2Page()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DP3Page()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DP4Page()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DP5Page()),
                    );
                    break;
                  case 5:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DP6Page()),
                    );
                    break;
                  case 6:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DP7Page()),
                    );
                    break;
                  case 7:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DP8Page()),
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
          productName = 'Paket Pancing Komplit';
          break;
        case 1:
          productName = 'Pancing TRD L300';
          break;
        case 2:
          productName = 'Kail Pancing';
          break;
        case 3:
          productName = 'Pancing Kayu';
          break;
        case 4:
          productName = 'Pancing Mania';
          break;
        case 5:
          productName = 'Tabung Pancing';
          break;
        case 6:
          productName = 'Umpan Pancing';
          break;
        case 7:
          productName = 'Tabung Pancing Variasi';
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
