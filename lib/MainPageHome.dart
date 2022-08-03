import 'package:flutter/material.dart';
import 'package:project3/categories.dart';
import 'package:project3/basket.dart';
import 'package:project3/product_details.dart';
import 'package:project3/profile.dart';

int initialIndexDeterminer = 0;

class MainPageHome extends StatelessWidget {
  const MainPageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndexDeterminer,
      length: 3,
      child: Scaffold(
        bottomNavigationBar: menu(sendBasket),
        body: TabBarView(

          children: [
            Categories(),
            MyBasket(),
            Profile(),
          ],
        ),
      ),
    );
  }
}




Widget menu(List basketList) {
  return TabBar(
    tabs: [
      const Tab(
        text: "Kategoriler",
        icon: Icon(Icons.category),
      ),
      Tab(
          text: "Sepetim",
          icon: basketList.isNotEmpty
              ? Stack(
                  children: const [
                    Icon(Icons.shopping_cart_outlined),
                    Positioned(
                      left: 15.0,
                      child: Icon(
                        Icons.brightness_1,
                        size: 10.0,
                        color: Colors.red,
                      ),
                    )
                  ],
                )
              : const Icon(Icons.shopping_cart_outlined)),
      const Tab(
        text: "Profil",
        icon: Icon(Icons.person),
      ),
    ],
  );
}
