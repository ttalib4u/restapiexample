import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'views/ProductBoxList.dart';
import 'model/Product.dart';
import 'requests/ProductRequest.dart';

void main() => runApp(MyApp(products: fetchProducts()));

class MyApp extends StatelessWidget {
  final Future<List<Product>> products;
  MyApp({Key? key, required this.products}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Product List Example', products: products),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Product>> products;
  MyHomePage({Key? key, required this.title, required this.products}) : super(key: key);

  // final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: Center(
          child: FutureBuilder<List<Product>>(
            future: products, builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData ? ProductBoxList(items: snapshot.data!)

            // return the ListView widget :
            :Center(child: CircularProgressIndicator());
          },
          ),
        )
    );
  }
}

