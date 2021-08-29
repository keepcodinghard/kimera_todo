import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox(
      {required this.categoryItems, this.direction: Axis.horizontal});

  final List<CategoryItem> categoryItems;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      width: double.infinity,
      child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: direction,
          children: categoryItems),
    );
  }
}
