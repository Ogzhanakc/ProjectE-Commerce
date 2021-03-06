import 'package:flutter/material.dart';
import 'package:project3/MainPageHome.dart';
import 'package:project3/basket.dart';
import 'package:project3/add_comment.dart';
import 'package:project3/models/basket_model.dart';
import 'constants.dart';
import 'main.dart';
import 'my_theme.dart';

int quantity = 1;
List<BasketModel> sendBasket = [];

class ProductDetail extends StatefulWidget {
  String? productName;
  String? image;
  String? price;
  int? id;
  String? productCode;
  String? sortDescription;

  ProductDetail(
      {this.productName,
      this.image,
      this.price,
      this.productCode,
      this.sortDescription});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName!),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyBasket(),
                ));
              },
              icon: sendBasket.isNotEmpty
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
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                child: Image.network(widget.image!),
              ),
              sizedBox(),
              Container(
                decoration: const BoxDecoration(

                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    Text(widget.productName!),
                    Text(widget.productCode!),
                  ],
                ),
              ),
              sizedBox(),
              Text(widget.sortDescription!),
              sizedBox(),
              Container(
                decoration: const BoxDecoration(

                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Miktar",

                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove)),
                        Text(quantity.toString()),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    )
                  ],
                ),
              ),
              sizedBox(),
              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hi?? Yorum yok",

                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => YorumEkle(),
                        ));
                      },
                      child: Row(
                        children: const [
                          Text(
                            "Yorum Ekle",

                          ),
                          Icon(
                            Icons.arrow_forward_ios,

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Yorumlar??n eklenece??i yer
              sizedBox(),
            ],
          ),
        ),
      ),
      //--------------------------------------
      //Alttaki butonlar??n bulundu??u row.
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                widget.price!,
                style: TextStyle(),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  sendBasket.add(BasketModel(
                      image: widget.image,
                      productName: widget.productName,
                      price: widget.price,
                      productCode: widget.productCode,
                      quantity: quantity.toString()));
                  initialIndexDeterminer = 1;
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainPageHome()));
                  quantity = 1;
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(

                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: iconSize,

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
          ],
        ),
      ),
      //--------------------------------------
    );
  }
}

SizedBox sizedBox() {
  return const SizedBox(height: 10);
}

//sat??n al butonu
/*
Expanded(
              child: GestureDetector(
                onTap: () {
                  print("butona t??kland??");

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyBasket()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  height: 50,
                  decoration: const BoxDecoration(

                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: iconSize,

                      ),
                      Text(
                        "Sat??n Al",

                      )
                    ],
                  ),
                ),
              ),
            ),
 */
