// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project3/Sepetim.dart';
import 'package:project3/YorumEkle.dart';
import 'constants.dart';
import 'my_theme.dart';

int sayi = 1;

class UrunInfo extends StatefulWidget {
  @override
  State<UrunInfo> createState() => _UrunInfoState();
}
bool light=true;
class _UrunInfoState extends State<UrunInfo> {
  List<Widget> finalList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ürün ismi"),
        actions: [
          Switch(value: light, onChanged: (state){
            setState((){
              light = state;
            });
          }),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Sepetim(),
                ));
              },
              icon: Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.asset("images/hazirlaniyor.jpeg"),
              ),
              sizedBox(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    Text("Ürün ismi"),
                    Text("Ürün kodu"),
                    Text(
                      "*****",
                    )
                  ],
                ),
              ),
              sizedBox(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Miktar",
                      style: styleWithYellow,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (sayi > 1) {
                                  sayi--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove)),
                        Text(sayi.toString()),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                sayi++;
                              });
                            },
                            icon: Icon(Icons.add)),
                      ],
                    )
                  ],
                ),
              ),
              sizedBox(),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hiç Yorum yok",
                      style: styleWithYellow,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => YorumEkle(),
                        ));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Yorum Ekle",
                            style: styleWithYellow,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: customYellow,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Yorumların ekleneceği yer
              sizedBox(),
              for (int i = 0; i < list.length; i++) list[i],
            ],
          ),
        ),
      ),
      //--------------------------------------
      //Alttaki butonların bulunduğu row.
      bottomSheet: Padding(
        padding: EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyTheme().buttonTheme.colorScheme.primary,
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: iconSize,
                        color: MyTheme().buttonTheme.colorScheme.secondary,
                      ),
                      Text(
                        "Sepete Ekle",
                        style: MyTheme().textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    color: customYellow,
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: iconSize,
                        color: Colors.white,
                      ),
                      Text(
                        "Satın Al",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //--------------------------------------
    );

    //APPBAR
    //ÜRÜN RESMİ
    //ÜRÜN İSMİ
    //ÜRÜN KODU
    //YILDIZ
    //MİKTARI
    //YORUM EKLEME
    //SEPETE EKLE VE SATIN AL BUTONU.
  }
}

SizedBox sizedBox() {
  return SizedBox(height: 10);
}
