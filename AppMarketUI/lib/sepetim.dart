import 'package:flutter/material.dart';

class Sepetim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
            child: Text(
          "Sepetim",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade400),
        )),
        ListTile(
          title: Text("Çikolatalı Gofret"),
          subtitle: Text("2x Adet 3.5TL"),
          trailing: Text("7TL"),
        ),
        ListTile(
          title: Text("Meyve Suyu"),
          subtitle: Text("2x Adet 3.5TL"),
          trailing: Text("7TL"),
        ),
        ListTile(
          title: Text("Islak Kek"),
          subtitle: Text("2x Adet 3.5TL"),
          trailing: Text("7TL"),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Column(
                children: [
                  Text(
                    "Toplam Tutar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "21TL",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Material(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.red.shade400),
                child: Center(
                  child: Text(
                    "Alışverişi tamamla",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
