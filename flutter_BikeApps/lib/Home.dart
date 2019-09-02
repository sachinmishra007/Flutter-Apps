import 'package:flutter/material.dart';
import 'package:ganesh_aarti_app/productDetails.dart';
import 'model.dart';

class HomePage extends StatelessWidget {
  final product = products[0];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new SizedBox(
            height: 500,
            width: double.infinity,
            child: new LayoutBuilder(
              builder: (cx, ct) {
                double w = ct.maxWidth;
                double h = ct.maxHeight;
                return new Stack(
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.topRight,
                      child: Hero(
                        tag: 'bg',
                        child: new Container(
                          width: w * .9,
                          height: h * .75,
                          color: new Color(
                            0xFFFFC5C5,
                          ),
                        ),
                      ),
                    ),
                    new Positioned(
                      top: 50,
                      left: 65,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            product.type,
                            style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          new SizedBox(
                            height: 20,
                          ),
                          new Text(
                            product.name,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                          )
                        ],
                      ),
                    ),
                    new Positioned(
                      top: h * .25,
                      left: -60,
                      child: new Hero(
                        tag: product.name,
                        child: Image.asset(
                          product.imageUrl,
                          width: 450,
                          height: 400,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          new SizedBox(
            height: 20,
          ),
          new Padding(
            padding: const EdgeInsets.only(
              left: 30,
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'Amazing Speed',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                new SizedBox(
                  height: 6,
                ),
                new Text(
                  "Incredible Power",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),
                new Text(
                    "The top Fuel 9.0 XX1 AXS is built for the Speed and Capapbility on Any terrin",
                    style: new TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15)),
                new SizedBox(
                  height: 10,
                ),
                new Align(
                  alignment: Alignment.bottomRight,
                  child: new Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: new Column(
                      children: <Widget>[
                        new IconButton(
                          alignment: Alignment.bottomRight,
                          icon: new Icon(
                            Icons.arrow_forward,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return new ProductDetail(
                                    product:product
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
