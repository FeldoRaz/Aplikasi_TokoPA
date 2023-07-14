import 'dart:convert';
import 'package:aplikasi_toko/keranjang.dart';
import 'package:aplikasi_toko/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
            const DrawerHeader(
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
              leading: const Icon(Icons.settings),
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

class _BerandaPage extends State<BerandaPage> {
  int _counter = 0;
  int total = 0;
  var dataJson;

  void _getDataFromStrapi() async {
    var response =
        await http.get(Uri.parse("http://localhost:1337/api/barangs"));
    dataJson = await jsonDecode(response.body);
    print(dataJson["meta"]["pagination"]["total"]);
    setState(() {
      total = dataJson["meta"]["pagination"]["total"];
    });
  }

  @override
  Widget build(BuildContext context) {
    _getDataFromStrapi();
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (index, context) {
            return ListTile(title: Text("Hello"),);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDataFromStrapi,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
