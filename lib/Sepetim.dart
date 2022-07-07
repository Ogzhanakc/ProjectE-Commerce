import 'package:flutter/material.dart';

class Sepetim extends StatefulWidget {
  const Sepetim({Key? key}) : super(key: key);

  @override
  State<Sepetim> createState() => _SepetimState();
}

bool deneme = true;

class _SepetimState extends State<Sepetim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Sepetim"),
      ),
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/hazirlaniyor.jpeg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
