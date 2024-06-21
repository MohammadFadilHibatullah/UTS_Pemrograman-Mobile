import 'package:flutter/material.dart';
import 'KBI.dart'; // Impor file KB.dart

class KeranjangI4Page extends StatefulWidget {
  final int quantityy;
  final int totalPricee;

  KeranjangI4Page({required this.quantityy, required this.totalPricee});

  @override
  _KeranjangI4PageState createState() => _KeranjangI4PageState();
}

class _KeranjangI4PageState extends State<KeranjangI4Page> {
  int totalItems = 0;
  double totalPrice = 0;
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    totalItems = widget.quantityy;
    totalPrice = widget.totalPricee.toDouble();
    cartItems = [
      {
        'image': 'assets/ikan_4.jpg',
        'title': 'Ikan Patin',
        'quantity': totalItems,
        'price': totalPrice / totalItems,
        'selected': false
      },
      {
        'image': 'assets/ikan_2.jpg',
        'title': 'Ikan Lele',
        'quantity': 2,
        'price': 68000.0,
        'selected': false
      },
      {
        'image': 'assets/ikan_5.jpg',
        'title': 'Ikan Mas',
        'quantity': 4,
        'price': 240000.0,
        'selected': false
      },
      {
        'image': 'assets/ikan_3.jpg',
        'title': 'Ikan Gurame',
        'quantity': 1,
        'price': 50000.0,
        'selected': false
      },
    ];
  }

  void _updateTotal() {
    int selectedItems = 0;
    double selectedPrice = 0;

    for (var item in cartItems) {
      if (item['selected']) {
        selectedItems += item['quantity'] as int;
        selectedPrice += item['quantity'] * item['price'] as double;
      }
    }

    setState(() {
      totalItems = selectedItems;
      totalPrice = selectedPrice;
    });
  }

  void _navigateToPaymentPage(List<Map<String, dynamic>> selectedItems) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentIPage(items: selectedItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cart Items
              for (var item in cartItems) _buildCartItem(item),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: _buildTotalInfo(), // Informasi yang mengambang
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: item['selected'],
            onChanged: (bool? value) {
              setState(() {
                item['selected'] = value!;
                _updateTotal();
              });
            },
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(item['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Harga per item: Rp ${item['price'].toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  'Jumlah: ${item['quantity']}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  'Total: Rp ${(item['price'] * item['quantity']).toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade300, Colors.blue.shade100],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ringkasan Pembelian',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          Divider(color: Colors.white),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Item: $totalItems',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text(
                'Total Bayar: Rp ${totalPrice.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                List<Map<String, dynamic>> selectedItems =
                    cartItems.where((item) => item['selected']).toList();
                _navigateToPaymentPage(selectedItems);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(color: Colors.white),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Beli Sekarang'),
            ),
          ),
        ],
      ),
    );
  }
}
