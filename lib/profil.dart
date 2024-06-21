import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profil'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Profil User'),
              Tab(text: 'Profil Developer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Profil User
            ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Icon(Icons.person, size: 100),
                SizedBox(height: 16),
                Text(
                  'INFORMASI LOGIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 16),
                Text('Username'),
                Text('123'),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: TextEditingController(text: '123'),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                        obscureText: _isObscured,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Profil Developer
            ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                buildProfileCard(
                  context,
                  'Mohammad Fadil Hibatullah',
                  '22082010001',
                  'Situbondo, 2 Mei 2004',
                  'Situbondo',
                  '085608512223',
                  '22082010001@student.upnjatim.ac.id',
                  'https://github.com/MohammadFadilHibatullah',
                  'assets/fadil.jpg',
                ),
                buildProfileCard(
                  context,
                  'Fachturozi',
                  '22082010021',
                  'Pasuruan, 23-06-2004',
                  'Jl. Kedinding Lor GG Bougenvil No. 29 Surabaya',
                  '082236333847',
                  'fachturozi2004@gmail.com / 22082010021@student.upnjatim.ac.id',
                  'https://github.com/fchtrz',
                  'assets/rozi.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileCard(
    BuildContext context,
    String name,
    String npm,
    String ttl,
    String address,
    String phoneNumber,
    String email,
    String githubUrl,
    String assetPath,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProfilePage(
              name: name,
              npm: npm,
              ttl: ttl,
              address: address,
              phoneNumber: phoneNumber,
              email: email,
              githubUrl: githubUrl,
              assetPath: assetPath,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(assetPath),
                radius: 30,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    npm,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailProfilePage extends StatelessWidget {
  final String name;
  final String npm;
  final String ttl;
  final String address;
  final String phoneNumber;
  final String email;
  final String githubUrl;
  final String assetPath;

  const DetailProfilePage({
    Key? key,
    required this.name,
    required this.npm,
    required this.ttl,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.githubUrl,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Profil'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(assetPath),
              ),
            ),
          ),
          SizedBox(height: 20),
          buildDetailItem('Nama', name),
          buildDetailItem('NPM', npm),
          buildDetailItem('TTL', ttl),
          buildDetailItem('Alamat', address),
          buildDetailItem('No. HP', phoneNumber),
          buildClickableDetailItem('Email', email, 'mailto:$email'),
          buildClickableDetailItem('GitHub', githubUrl, githubUrl),
        ],
      ),
    );
  }

  Widget buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildClickableDetailItem(String label, String value, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilPage(),
  ));
}
