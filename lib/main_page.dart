// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title:  Text("Ana Sayfa"),
        ),
      ],
    );
  }
}
