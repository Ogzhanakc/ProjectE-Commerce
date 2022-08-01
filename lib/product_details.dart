import 'package:flutter/material.dart';
import 'package:project3/MainPageHome.dart';
import 'package:project3/basket.dart';
import 'package:project3/add_comment.dart';
import 'package:project3/models/basket_model.dart';
import 'constants.dart';
import 'my_theme.dart';

int sayi = 1;

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
              icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.network(widget.image!),
              ),
              sizedBox(),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
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
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
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
                            icon: const Icon(Icons.remove)),
                        Text(sayi.toString()),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                sayi++;
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
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
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
                        children: const [
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
            ],
          ),
        ),
      ),
      //--------------------------------------
      //Alttaki butonların bulunduğu row.
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                //sepete elemanı push etme işlemi burada
                onTap: () {
                  print("butona tıklandı");

                  //Navigator.of(context).push(MaterialPageRoute(
                  //builder: (context) => MyBasket(model: BasketModel(image: widget.image, productName: widget.productName, price: widget.price, productCode: widget.productCode, quantity:sayi.toString()))));

                  MyBasket.of(context)?.basketlist?.add(BasketModel(
                      image: widget.image,
                      productName: widget.productName,
                      price: widget.price,
                      productCode: widget.productCode,
                      quantity: sayi.toString()));
                  //print(MyBasket.of(context)?.products.length);
                },
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
                onTap: () {
                  print("butona tıklandı");

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyBasket()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  height: 50,
                  decoration: const BoxDecoration(
                    color: customYellow,
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
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
  return const SizedBox(height: 10);
}
