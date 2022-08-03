import 'package:flutter/material.dart';

import 'main.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

//Buraya dark mode üye girişi vs yerleştirilecek.
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Dark Mode"),
                Switch(
                    value: MainPage.of(context)!.darkThemeBool,
                    onChanged: (state) {
                      setState(() {
                        MainPage.of(context)!.switcher();
                      });
                    })
              ],
            ),
          ),
          // CustomSearchDelegate();
        ],
      ),
    );
  }
}
