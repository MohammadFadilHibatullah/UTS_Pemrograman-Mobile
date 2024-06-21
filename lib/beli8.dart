import 'package:flutter/material.dart';
import 'notif8.dart'; // Import dialog notifikasi

class Beli8Page extends StatefulWidget {
  final int quantity;
  final int totalPrice;

  Beli8Page({required this.quantity, required this.totalPrice});

  @override
  _Beli8PageState createState() => _Beli8PageState();
}

class _Beli8PageState extends State<Beli8Page> {
  String selectedPaymentMethod = '';
  int additionalCharge = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Informasi Pengiriman
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alamat Pengiriman',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fadil | (+62) 856-0851-2223',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Jl. Rungkut Asri Timur XV Blok 6 ',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Gang XV, RKVH-6, Rungkut, Kota Surabaya, Jawa Timur, ID 60295',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Ringkasan Pesanan
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ringkasan Pesanan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildOrderItem(
                      'Tabung Pancing Variasi',
                      'Rp 90.000',
                      'assets/pan.jpg',
                      widget.quantity,
                      widget.totalPrice,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Harga',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp ${widget.totalPrice}',
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
              SizedBox(height: 16),
              // Metode Pembayaran
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildPaymentOption('COD', Icons.monetization_on, 1000),
                    _buildPaymentOption('OVO', Icons.money, 2000),
                    _buildPaymentOption('DANA', Icons.money, 2000),
                    _buildPaymentOption('GOPAY', Icons.money, 2000),
                    _buildPaymentOption(
                        'Bank BRI', Icons.account_balance, 4000),
                    _buildPaymentOption(
                        'Bank BCA', Icons.account_balance, 4000),
                    _buildPaymentOption(
                        'Bank Mandiri', Icons.account_balance, 4000),
                    _buildPaymentOption(
                        'Bank BNI', Icons.account_balance, 4000),
                    _buildPaymentOption(
                        'Bank Jatim', Icons.account_balance, 4000),
                    SizedBox(height: 16),
                    Text(
                      'Rincian Pembayaran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Harga',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Rp ${widget.totalPrice}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Biaya Tambahan',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Rp $additionalCharge',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Pembayaran',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp ${widget.totalPrice + additionalCharge}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Tombol Konfirmasi Pembayaran
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    int totalPayment = widget.totalPrice + additionalCharge;

                    // Tampilkan dialog konfirmasi
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Confirmation8Dialog(totalPayment: totalPayment);
                      },
                    );
                  },
                  child: Text('Konfirmasi Pembayaran'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderItem(String name, String price, String imageUrl,
      int quantity, int totalPrice) {
    return Row(
      children: [
        Image.asset(
          imageUrl,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Harga per item: $price',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'Jumlah: $quantity',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'Total: Rp $totalPrice',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String method, IconData icon, int charge) {
    return ListTile(
      title: Text(method),
      leading: Icon(icon),
      trailing: Radio<String>(
        value: method,
        groupValue: selectedPaymentMethod,
        onChanged: (value) {
          setState(() {
            selectedPaymentMethod = value!;
            additionalCharge = charge;
          });
        },
      ),
      onTap: () {
        setState(() {
          selectedPaymentMethod = selectedPaymentMethod == method ? '' : method;
          additionalCharge = selectedPaymentMethod == method ? 0 : charge;
        });
      },
    );
  }
}
