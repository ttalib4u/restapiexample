import 'package:flutter/material.dart';
import '../model/Product.dart';
import 'ProductBox.dart';

class ProductBoxList extends StatelessWidget {
  final List<Product> items;
  ProductBoxList({Key? key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ProductBox(item: items[index],),
          onTap: () {},
        );
      },
    );
  }
}