// ignore_for_file: prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:project3/product_details.dart';
import 'product_details.dart';

class YorumEkle extends StatefulWidget {


  @override
  State<YorumEkle> createState() => _YorumEkleState();
}
List<Widget> list =[];
class _YorumEkleState extends State<YorumEkle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yorum Ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Konu",
              ) ,

            ),
            sizedBox(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Yorum",
              ) ,
            ),
            sizedBox(),
            ElevatedButton(onPressed: (){
              setState((){
                list.add(Container(
                  color: Colors.blueGrey,
                  height: 50,
                ));
                list.add(sizedBox());

              });
            }, child: Text("Gönder")),


          ],
        ),
      ),
    );
  }
}

