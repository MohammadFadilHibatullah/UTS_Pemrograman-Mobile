import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'Home.dart'; // Import halaman utama
import 'SignUp.dart'; // Import halaman pendaftaran

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword =
      false; // Menambahkan variabel untuk menunjukkan apakah password ditampilkan atau tidak
  String? _registeredUsername;
  String? _registeredPassword;

  @override
  void initState() {
    super.initState();
    // Tetapkan username dan password yang telah ditentukan
    _registeredUsername = '123';
    _registeredPassword = '123';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container untuk mengisi layar penuh dengan latar belakang transparan
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/bgikan.jpg'),
              fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran container
            ),
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              icon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: EdgeInsets.all(
                                  15.0), // Increased content padding
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            obscureText:
                                !_showPassword, // Gunakan nilai _showPassword
                            decoration: InputDecoration(
                              labelText: 'Password',
                              icon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: EdgeInsets.all(
                                  15.0), // Increased content padding
                              suffixIcon: IconButton(
                                // Tambahkan icon button untuk menampilkan atau menyembunyikan password
                                icon: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
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

                              if (username == _registeredUsername &&
                                  password == _registeredPassword) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              } else {
                                Flushbar(
                                  message: 'Username atau password salah.',
                                  icon: Icon(
                                    Icons.error,
                                    size: 28.0,
                                    color: Colors.red,
                                  ),
                                  leftBarIndicatorColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                  margin: EdgeInsets.all(8),
                                  borderRadius: BorderRadius.circular(8),
                                )..show(context);
                              }
                            },
                            child: Text('Masuk'),
                          ),
                          SizedBox(height: 10.0),
                          TextButton(
                            onPressed: () async {
                              Map<String, String?>? userData =
                                  await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );

                              if (userData != null) {
                                setState(() {
                                  _registeredUsername = userData['username'];
                                  _registeredPassword = userData['password'];
                                });

                                _usernameController.text =
                                    userData['username'] ?? '';
                                _passwordController.text =
                                    userData['password'] ?? '';
                              }
                            },
                            child: Text('Belum punya akun? Sign Up'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Ikon back di luar Stack
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 255, 255, 255)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
