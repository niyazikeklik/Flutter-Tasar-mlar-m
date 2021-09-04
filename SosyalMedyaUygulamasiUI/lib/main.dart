import 'package:flutter/material.dart';
import 'package:flutter_application_2/gonderikarti.dart';
import 'package:flutter_application_2/profilSayfasi.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.grey, size: 32),
            onPressed: () {}),
        title: Text(
          "Socialworld",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.notifications,
                  color: Colors.purple.shade300, size: 32),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          duyuru("Kamil seni takip etti", "3dk önce"),
                          duyuru("Duygu gönderine yorum yaptı", "5 saat önce"),
                          duyuru("Niyazi mesaj gönderdi", "1 gün önce"),
                        ],
                      );
                    });
              })
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0, 3), blurRadius: 5),
            ]),
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profilKartiOlustur(
                    "Niyazi",
                    "https://pbs.twimg.com/profile_images/1304562819883585536/ueUE_BgC_400x400.jpg",
                    "niyazikeklk",
                    "https://pbs.twimg.com/profile_banners/4299694169/1623984370/1080x360"),
                profilKartiOlustur(
                    "Ayşe Nur",
                    "https://pbs.twimg.com/profile_images/1431390725174870026/rFcodoQq_400x400.jpg",
                    "aysenuryldrm",
                    "https://pbs.twimg.com/profile_banners/4299694169/1623984370/1080x360"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GonderiKarti(
              "Kübra",
              "1 Saat önce",
              "Kadıköy",
              "https://pbs.twimg.com/profile_images/1415313430844694529/tiw71Lhq_400x400.jpg",
              "https://pbs.twimg.com/profile_images/1304562819883585536/ueUE_BgC_400x400.jpg"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple.shade300,
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding duyuru(String mesaj, String sure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mesaj,
            style: TextStyle(fontSize: 15),
          ),
          Text(sure),
        ],
      ),
    );
  }

  Widget profilKartiOlustur(String isim, String fotografUrl,
      String kullaniciadi, String kapakfotografurl) {
    return Material(
      child: InkWell(
        onTap: () async {
          String result = await Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ProfilSayfasi(
                isim, kullaniciadi, kapakfotografurl, fotografUrl);
          }));
          print(result);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: kullaniciadi,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(fotografUrl),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(35.0)),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(height: 5),
              Text(
                isim,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
