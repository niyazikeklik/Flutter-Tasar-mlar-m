import 'package:flutter/material.dart';

class GonderiKarti extends StatelessWidget {
  final String isim, saat, aciklama, resimurl, icerikresimurl;

  GonderiKarti(
      this.isim, this.saat, this.aciklama, this.resimurl, this.icerikresimurl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: double.infinity,
          height: 380,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.indigo,
                            image: DecorationImage(
                                image: NetworkImage(resimurl),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isim,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              saat,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
              SizedBox(height: 15),
              Text(
                aciklama,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Image.network(icerikresimurl,
                  width: double.infinity, height: 200, fit: BoxFit.cover),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IkonluButonum(Icons.favorite, "Beğen", () {}),
                  IkonluButonum(Icons.comment, "Yorum yap", () {}),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.share, color: Colors.grey),
                      label: Text(
                        "Paylaş",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IkonluButonum extends StatelessWidget {
  final IconData ic;
  final String text;
  final fonks;
  IkonluButonum(this.ic, this.text, this.fonks);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: fonks,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                ic,
                color: Colors.grey,
              ),
              SizedBox(width: 8),
              Text(
                text,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
