import 'package:coba/map.dart';
import 'package:flutter/material.dart';
import 'Fitur1.dart';
import 'Fitur2.dart';
import 'login.dart';
import 'dart:async';
import 'profil.dart';
import 'chat2.dart';

void main() {
  runApp(MaterialApp(
    title: 'FISHPEDIA',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: {
  '/': (context) => MyHomePage(),
  '/fitur1': (context) => Fitur1Page(),
  '/fitur2': (context) => Fitur2Page(),
  '/fitur3': (context) => MyHomePageMap(title: 'Kolam Terdekat'),
},
  ));
}

class MyHomePage extends StatefulWidget {
@override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _bannerPageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    // Menjalankan pergerakan otomatis setiap 3 detik
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_bannerPageController.page == 2) {
        _bannerPageController.jumpToPage(0);
      } else {
        _bannerPageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                'FISHPEDIA',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              floating: true,
              pinned: true,
              snap: false,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hello User',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/person.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: PageView.builder(
                  controller: _bannerPageController,
                  itemCount: 3, // Jumlah banner
                  itemBuilder: (BuildContext context, int index) {
                  return _buildBanner('assets/bannerhome${index + 1}.png');
                },
              ),
            ),
                SizedBox(height: 16),
                Center(
                  child: Wrap(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: _buildSubjectButton(context, 'Toko Alat', 'assets/fishing.png', Fitur1Page()),
                      ),
                      Expanded(
                        child: _buildSubjectButton(context, 'Toko Ikan', 'assets/fish.png', Fitur2Page()),
                      ),
                      Expanded(
                        child: _buildSubjectButton(context, 'Kolam\nTerdekat', 'assets/location.png', MyHomePageMap(title: 'Kolam Terdekat')),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Rekomendasi Kolam Pemancingan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildRecoCard('Kolam Pancing\nPak Dhe Munandar', 'Pakal', 'assets/pakdhe.jpeg', 1581),
                      _buildRecoCard('Kolam Pancing\nBumi Gacar', 'Wonorejo', 'assets/bumigacar.jpeg', 1235),
                      _buildRecoCard('Kolam Pancing\nMaritim', 'Balas Klumprik', 'assets/maritim.jpeg', 921),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Alat Pancing Paling Dicari',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildRecoCard('Alat Pancing\nMaguro', 'Rp 465.000', 'assets/maguro.jpg', 1398),
                      _buildRecoCard('Alat Pancing\nExori', 'Rp 221.000', 'assets/exori.jpg', 1130),
                      _buildRecoCard('Alat Pancing\nKenzi', 'Rp 305.000', 'assets/kenzi.jpg', 851),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade200,
              ),
              child: Center(
                child: Image.asset(
                  'assets/logo.jpg',
                  height: 200,
                  width: 400,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Image.asset('assets/fishing.png', width: 22, height: 22),
              title: Text('Toko Alat'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fitur1Page()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Image.asset('assets/fish.png', width: 22, height: 22),
              title: Text('Toko Ikan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fitur2Page()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Image.asset('assets/location.png', width: 22, height: 22),
              title: Text('Kolam Terdekat'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePageMap(title: 'Kolam Terdekat')),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Colors.lightBlue.shade300,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
    switch(index) {
      case 0:
        // Tambahkan navigasi untuk halaman beranda jika diperlukan
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilPage()),
        );
        break;
    }
  },
      ),
    );
  }

  Widget _buildBanner(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildSubjectButton(BuildContext context, String subject, String imagePath, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 150,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Image.asset(
                imagePath,
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 8),
            Text(
              subject,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecoCard(String name, String subject, String avatarPath, int rating) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow:[
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 125,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  image: DecorationImage(
                    image: AssetImage(avatarPath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
              ),
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                subject,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 16, color: Colors.yellow),
                  Text('$rating'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

