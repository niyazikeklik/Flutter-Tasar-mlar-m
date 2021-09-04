import 'package:flutter/material.dart';
import 'package:flutter_application_2/gonderikarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final String isimsoyad;
  final String kullaniciadi;
  final String kapakresimlink;
  final String profilresmilinki;

  const ProfilSayfasi(this.isimsoyad, this.kullaniciadi, this.kapakresimlink,
      this.profilresmilinki);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: ListView(children: [
          Stack(
            // Üst üste eklemeni sağlıyor.
            children: [
              Container(
                height: 230,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(kapakresimlink),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                // stack içinde  tek bir elemanı konumlandırmak için.
                bottom: 0,
                left: 20,
                child: Hero(
                  tag: kullaniciadi,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(width: 2, color: Colors.white),
                        image: DecorationImage(
                            image: NetworkImage(profilresmilinki),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 145,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // column içerisindeki elemanları sola hizalamak için.

                  children: [
                    Text(
                      isimsoyad,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      kullaniciadi,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 130,
                right: 15,
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200,
                      border: Border.all(width: 2.0, color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Takip et",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context, "Döndüm");
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 75,
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // row içindei elemanların hem birbirleriyle hem kenarlarla eşit aralıkta olmasını sağlar
              children: [
                sayac("Takipçi", "20k"),
                sayac("Takip", "500"),
                sayac("Paylaşım", "75"),
              ],
            ),
          ),
          GonderiKarti(
              "Kübra",
              "1 Saat önce",
              "Kadıköy",
              "https://pbs.twimg.com/profile_images/1415313430844694529/tiw71Lhq_400x400.jpg",
              "https://pbs.twimg.com/profile_images/1304562819883585536/ueUE_BgC_400x400.jpg")
        ]));
  }

  Column sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment
          .center, // Colum içinde dikey eksende ortalma hizalama
      children: [
        Text(
          sayi,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 1,
        ),
        Text(
          baslik,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600),
        )
      ],
    );
  }
}
