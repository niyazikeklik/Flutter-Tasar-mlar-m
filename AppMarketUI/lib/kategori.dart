import 'package:flutter/material.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori(this.kategori);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List<Widget> gosterilecekList = [];
  @override
  void initState() {
    super.initState();
    if (widget.kategori == "Temel Gıda") {
      gosterilecekList = [
        urunKarti("Zeytin Yağı", "23.50TL",
            "https://cdn.pixabay.com/photo/2014/05/28/00/27/olive-oil-356102_1280.jpg"),
        urunKarti("Süt", "3.50TL",
            "https://cdn.pixabay.com/photo/2014/12/11/02/56/coffee-563797_1280.jpg"),
        urunKarti("Zeytin Yağı", "23.50TL",
            "https://cdn.pixabay.com/photo/2014/05/28/00/27/olive-oil-356102_1280.jpg"),
        urunKarti("Zeytin Yağı", "23.50TL",
            "https://cdn.pixabay.com/photo/2014/05/28/00/27/olive-oil-356102_1280.jpg"),
      ];
    } else if (widget.kategori == "Şekerleme") {
      gosterilecekList = [
        urunKarti("Zeytin Yağı", "23.50TL",
            "https://cdn.pixabay.com/photo/2014/05/28/00/27/olive-oil-356102_1280.jpg"),
        urunKarti("Zeytin Yağı", "23.50TL",
            "https://cdn.pixabay.com/photo/2014/05/28/00/27/olive-oil-356102_1280.jpg"),
      ];
    } else if (widget.kategori == "İçecek") {
      gosterilecekList = [
        urunKarti("Zeytin Yağı", "23.50TL",
            "https://cdn.pixabay.com/photo/2014/05/28/00/27/olive-oil-356102_1280.jpg"),
        urunKarti("Süt", "3.50TL",
            "https://cdn.pixabay.com/photo/2014/12/11/02/56/coffee-563797_1280.jpg"),
      ];
    } else if (widget.kategori == "Temizlik") {
      gosterilecekList = [
        urunKarti("Süt", "3.50TL",
            "https://cdn.pixabay.com/photo/2014/12/11/02/56/coffee-563797_1280.jpg"),
        urunKarti("Zeytin Yağı", "23.50TL",
            "https://cdn.pixabay.com/photo/2014/05/28/00/27/olive-oil-356102_1280.jpg"),
      ];
    }
  }

  Widget urunKarti(String isim, String fiyat, String resimURL) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 2.0)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(resimURL), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            isim,
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            fiyat,
            style: TextStyle(
                fontSize: 14,
                color: Colors.red.shade400,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12, //Üst üste duranlar için boşluk
      crossAxisSpacing: 12, // yan yana duranlar için boşluk
      padding: EdgeInsets.all(10),
      childAspectRatio:
          1, // en boy oranı yani eni boyuna eşit olsun yani kare olsun.
      children: gosterilecekList,
    );
  }
}
