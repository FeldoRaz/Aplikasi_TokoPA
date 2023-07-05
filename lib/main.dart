import 'package:aplikasi_toko/keranjang.dart';
import 'package:aplikasi_toko/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TokoApp());
}

class TokoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BerandaPage(),
    );
  }
}
/////////////////////////////////////////   Login PAGE    //////////////////////////////////////

/////////////////////////////////////////   Bottom Nvaigation and Drawer   //////////////////////////////////////
class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    Text('Beranda'),
    Text('Kategori'),
    Text('Keranjang'),
    Text('Akun'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BerandaPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BerandaPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyKeranjang()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => loginapp()),
      );
      //berpindah ke loginapp
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
              onTap: () {
                // Aksi ketika menu pengaturan dipilih
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Bantuan'),
              onTap: () {
                // Aksi ketika menu bantuan dipilih
              },
            ),
          ],
        ),
      ),
    );
  }
}
