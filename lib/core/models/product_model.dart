import 'dart:io';

import 'package:fruits_app/core/entites/product_input_entity.dart';
import 'package:fruits_app/core/models/review_model.dart';

class ProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.reviews,
    required this.isFeatured,
    required this.image,
    required this.imageUrl,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.sellingCount,
  });

  factory ProductInputModel.fromJson(Map<String, dynamic> json) {
    return ProductInputModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationsMonths: json['expirationsMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      sellingCount: json['sellingCount'],
      reviews: (json['reviews'] != null)
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
      image: File(json['imageUrl']),
    );
  }

 ProductInputEntity toEntity() {
    return ProductInputEntity(
        name: name,
        code: code,
        description: description,
        price: price,
        isFeatured: isFeatured,
        image: image,
        imageUrl: imageUrl,
        expirationsMonths: expirationsMonths,
        isOrganic: isOrganic,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        sellingCount: sellingCount,
        reviews: reviews.map((e) => e.toEntity()).toList());
  }

  toMap() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl
    };
  }
}
