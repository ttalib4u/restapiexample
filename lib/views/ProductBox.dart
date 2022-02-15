import 'package:flutter/material.dart';
import '../model/Product.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:intl/intl.dart' as intl;

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);
  final Product item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2), height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height,

                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    fit: BoxFit.fill,
                    image: this.item.image,
                  ),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(this.item.name, style:TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(this.item.description),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("NGN " + intl.NumberFormat.decimalPattern().format(this.item.price).toString(), style:TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            //RatingBox(),
                          ],
                        )
                    )
                )
              ]
          ),
        )
    );
  }
}