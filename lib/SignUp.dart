import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
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
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: SignUpForm(),
            ),
            // Ikon back di kiri atas layar
            Positioned(
              top: 40.0,
              left: 10.0,
              child: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Color.fromARGB(255, 255, 255,
                        255)), // Ubah warna ikon back menjadi hitam
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false; // Menambahkan variabel untuk menampilkan password

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450.0,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Ubah warna menjadi transparan
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.0),
          Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              icon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(15.0),
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            controller: _passwordController,
            obscureText:
                !_showPassword, // Gunakan nilai _showPassword untuk menampilkan atau menyembunyikan password
            decoration: InputDecoration(
              labelText: 'Password',
              icon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(15.0),
              suffixIcon: IconButton(
                // Tambahkan icon button untuk menampilkan atau menyembunyikan password
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              String username = _usernameController.text;
              String password = _passwordController.text;

              // Send username and password back to login page
              Navigator.pop(
                context,
                {'username': username, 'password': password},
              );
            },
            child: Text('Sign Up'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
