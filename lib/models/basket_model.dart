import 'package:flutter/material.dart';
import 'package:project3/basket_card.dart';

class BasketModel{
  String? image;
  String? productName;
  String? price;
  String? productCode;
  String? quantity;

  BasketModel({required this.image,required this.productName,required this.price,required this.productCode,
      required this.quantity});

}