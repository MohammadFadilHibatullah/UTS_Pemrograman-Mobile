import 'package:flutter/material.dart';
import 'belii3.dart'; // Import file beli.dart
import 'keranjangi3.dart'; // Import file Keranjang2.dart
import 'chat.dart'; // Import file chat.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pancing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DPI3Page(),
    );
  }
}

class DPI3Page extends StatefulWidget {
  @override
  _DPI3PageState createState() => _DPI3PageState();
}

class _DPI3PageState extends State<DPI3Page> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _selectedIndex = 0;
  int _quantity = 1;
  int _quantityy = 1;
  final int _price = 50000;
  final int _pricee = 50000;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      _showBuyNowModal1();
    } else if (index == 0) {
      // Ketika ikon chat ditekan
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatPage()),
      );
    } else if (index == 2) {
      // Ketika ikon Beli Sekarang ditekan
      _showBuyNowModal();
    }
  }

  void _showBuyNowModal1() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enable scrolling if content overflows
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
                left: 16,
                right: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 150, // Adjust size as needed
                        height: 150, // Adjust size as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage('assets/ikan_3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 16), // Space between image and content below
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jumlah Produk',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (_quantityy > 1) _quantityy--;
                                });
                              },
                            ),
                            Text(
                              '$_quantityy',
                              style: TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _quantityy++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Harga',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp ${(_quantityy * _pricee).toString()}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        _navigateToKeranjangPage3(
                            _quantityy, _quantityy * _pricee);
                      },
                      child: Text('Masukkan Keranjang'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // warna background
                        foregroundColor: Colors.white, // warna text
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // rounded corners
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showBuyNowModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enable scrolling if content overflows
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
                left: 16,
                right: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 150, // Adjust size as needed
                        height: 150, // Adjust size as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage('assets/ikan_3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 16), // Space between image and content below
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jumlah Produk',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (_quantity > 1) _quantity--;
                                });
                              },
                            ),
                            Text(
                              '$_quantity',
                              style: TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Harga',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp ${(_quantity * _price).toString()}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        _navigateToBeli3Page(_quantity, _quantity * _price);
                      },
                      child: Text('Checkout'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // warna background
                        foregroundColor: Colors.white, // warna text
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // rounded corners
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

// Function to navigate to Beli.dart with parameters
  void _navigateToBeli3Page(int quantity, int totalPrice) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            BeliI3Page(quantity: quantity, totalPrice: totalPrice),
      ),
    );
  }

  void _navigateToKeranjangPage3(int quantityy, int totalPricee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            KeranjangI3Page(quantityy: quantityy, totalPricee: totalPricee),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      Image.asset(
                        'assets/ikan_3.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/ikan_4.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/ikan_5.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      List<Widget> indikator = [];
                      for (int i = 0; i < 3; i++) {
                        indikator.add(
                          i == _currentPage
                              ? _buildIndicator(true)
                              : _buildIndicator(false),
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indikator,
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rp 50.000',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_half, color: Colors.yellow),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '4.7/5',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ikan Gurame',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '756 terjual',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_shipping,
                          color: Colors.green,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Garansi tiba: 1 Hari',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Deskripsi Produk',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Ini adalah ikan gurame yang berkualitas dan fresh.',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.store,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Toko Barokah',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Text(
                      'Penilaian Produk',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    _buildReviewItem(
                      'User123',
                      'https://via.placeholder.com/150',
                      'Produk sangat bagus dan sesuai dengan deskripsi.',
                      5,
                    ),
                    _buildReviewItem(
                      'Angler456',
                      'https://via.placeholder.com/150',
                      'Kualitas mantap! Pengiriman cepat.',
                      4,
                    ),
                    _buildReviewItem(
                      'Coki',
                      'https://via.placeholder.com/150',
                      'Kualitas mantap! tapi kurirnya kurang ramah jadi bintang 3 saja.',
                      3,
                    ),
                    _buildReviewItem(
                      'FishingPro',
                      'https://via.placeholder.com/150',
                      'Harganya sangat terjangkau untuk paket lengkap ini.',
                      5,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Text(
              'Beli Sekarang',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 254, 254),
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blue.shade300,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildReviewItem(
      String username, String userImageUrl, String review, int rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userImageUrl),
            radius: 20,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.yellow,
                          size: 14,
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  review,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
