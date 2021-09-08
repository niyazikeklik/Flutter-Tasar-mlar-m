import 'package:flutter/material.dart';
import 'package:flutter_application_3/sepetim.dart';
import 'package:flutter_application_3/urunler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List _icerikler = [];
  int akftifIcerikIndex = 0;
  @override
  void initState() {
    super.initState();
    _icerikler = [Urunler(), Sepetim()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Uçarak gelsin",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: _icerikler[akftifIcerikIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ürünler"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Sepetim")
        ],
        currentIndex: akftifIcerikIndex, // Seçilmiş aktif olan butonu belirler.
        selectedItemColor: Colors.red, // Aktif ve aktif olmayan buton renkleri.
        unselectedItemColor:
            Colors.grey, // Aktif ve aktif olmayan buton renkleri.
        onTap: (int tiklananIndex) {
          setState(() {
            // Değişken değişince tasarımın değişmesi için haberdar ediyor.
            akftifIcerikIndex = tiklananIndex;
          });
        },
      ),
    );
  }
}
