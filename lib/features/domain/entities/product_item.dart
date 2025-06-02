import 'package:flutter/cupertino.dart';

class ProductItem with ChangeNotifier {
  final int id;
  final String name;
  final int cost;
  final String image;

  ProductItem({
    required this.id,
    required this.name,
    required this.cost,
    required this.image,
  });

  factory ProductItem.fromRow(Map<String, dynamic> row) {
    return ProductItem(
      id: row['id'] as int,
      name: row['name'] as String,
      cost: row['cost'] as int,
      image: row['image'] as String,
    );
  }
}