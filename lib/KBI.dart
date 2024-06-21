import 'package:flutter/material.dart';
import 'Fitur2.dart';

class PaymentIPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  PaymentIPage({required this.items});

  @override
  _PaymentIPageState createState() => _PaymentIPageState();
}

class _PaymentIPageState extends State<PaymentIPage> {
  String _selectedPaymentMethod = 'COD';
  int _additionalCharge = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.blue,
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
              // Ringkasan Pembelian
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
                      'Ringkasan Pembelian',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(color: Colors.grey),
                    SizedBox(height: 8),
                    // List of selected items
                    for (var item in widget.items) _buildSelectedItem(item),
                    SizedBox(height: 16),
                    // Metode Pembayaran
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
                          'Rp ${_calculateTotalPrice().toStringAsFixed(0)}',
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
                          'Rp $_additionalCharge',
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
                          'Rp ${_calculateTotalPayment().toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          int totalPayment = _calculateTotalPayment().toInt();

                          // Tampilkan dialog konfirmasi
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ConfirmationIDialog(
                                  totalPayment: totalPayment);
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedItem(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
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
          Expanded(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                item['image'],
                fit: BoxFit.cover,
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  Widget _buildPaymentOption(String method, IconData icon, int charge) {
    return ListTile(
      title: Text(method),
      leading: Icon(icon),
      trailing: Radio<String>(
        value: method,
        groupValue: _selectedPaymentMethod,
        onChanged: (value) {
          setState(() {
            _selectedPaymentMethod = value!;
            _additionalCharge = charge;
          });
        },
      ),
      onTap: () {
        setState(() {
          _selectedPaymentMethod = method;
          _additionalCharge = charge;
        });
      },
    );
  }

  double _calculateTotalPrice() {
    double total = 0;
    for (var item in widget.items) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  double _calculateTotalPayment() {
    return _calculateTotalPrice() + _additionalCharge;
  }
}

class ConfirmationIDialog extends StatelessWidget {
  final int totalPayment;

  ConfirmationIDialog({required this.totalPayment});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 66,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 66),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Pembayaran Berhasil!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Total Pembayaran: Rp $totalPayment\n\nTerima kasih telah melakukan pembayaran.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Tutup dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Fitur2Page(),
                      ),
                    );
                  },
                  child: Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 66,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 56,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ConfirmationIDialog(totalPayment: 100),
     routes: {
       '/Fitur1Page': (context) => Fitur2Page(),
     },
  ));
}

