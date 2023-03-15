// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  Product({
    this.images,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.phoneNumber,
    required this.userName,
    required this.adress,
    this.pricers,
  });

  final List<String>? images;
  final String title;
  final String description;
  final String dateTime;
  final String phoneNumber;
  final String userName;
  final String adress;
  final String? pricers;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'images': images,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'phoneNumber': phoneNumber,
      'userName': userName,
      'adress': adress,
      'pricers': pricers,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      images: map['images'] != null
          ? List<String>.from((map['images'] as List<dynamic>))
          : null,
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: map['dateTime'] as String,
      phoneNumber: map['phoneNumber'] as String,
      userName: map['userName'] as String,
      adress: map['adress'] as String,
      pricers: map['pricers'] != null ? map['pricers'] as String : null,
    );
  }
}
