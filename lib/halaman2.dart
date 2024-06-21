import 'package:flutter/material.dart';
import 'login.dart'; // Tambahkan impor ini

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bgikan.jpg'),
              fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran container
            ),
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue.shade200,
              Color.fromARGB(255, 10, 118, 168)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'FISHPEDIA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                      width:
                          48), // To balance the alignment with the back button
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.jpg',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Selamat Datang',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Fishpedia adalah platform terintegrasi untuk pembelian dan penjualan alat serta umpan pancing, jual beli ikan hasil tangkapan, serta memberikan informasi tempat pemancingan terdekat bagi pengguna. Fishpedia bertujuan untuk menjadi solusi komprehensif bagi komunitas pemancing, menawarkan kenyamanan dan aksesibilitas dalam satu aplikasi.',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 200, // Set the width to a smaller size
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0), // Adjust the padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: Colors.blue, // Button color
                    foregroundColor: Colors.white, // Text color
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lanjutkan',
                        style: TextStyle(
                          fontSize: 16, // Adjust the font size if needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}