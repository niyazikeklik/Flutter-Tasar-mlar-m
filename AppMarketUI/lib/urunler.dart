import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/kategori.dart';

class Urunler extends StatefulWidget {
  const Urunler({Key? key}) : super(key: key);

  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin
  late TabController tvKontrol;

  @override
  void initState() {
    tvKontrol = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: [
            Tab(
              child: Text(
                "Temel Gıda",
              ),
            ),
            Tab(
              child: Text("Şekerleme"),
            ),
            Tab(
              child: Text("İçecek"),
            ),
            Tab(
              child: Text("Temizlik"),
            ),
          ],
          controller: tvKontrol,
          indicatorColor: Colors.red.shade400,
          labelColor: Colors.red.shade400,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight
                  .w500), // sekmelerin ekrana sığmazsa kaymasını sağlar.
        ),
        Expanded(
          // Ana eksende tüm ekranı kaplar.
          child: TabBarView(children: [
            Kategori("Temel Gıda"),
            Kategori("Şekerleme"),
            Kategori("İçecek"),
            Kategori("Temizlik")
          ], controller: tvKontrol),
        ),
      ],
    );
  }
}
