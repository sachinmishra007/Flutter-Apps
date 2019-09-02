import 'package:flutter/material.dart';
import './model.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({this.product});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Hero(
            tag: 'bg',
            child: new Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFFFFC5C5),
            ),
          ),
          SingleChildScrollView(
            child: new Padding(
              padding: const EdgeInsets.only(left: 35),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 18,
                      top: 50,
                      bottom: 20,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          product.type,
                          style: new TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        new Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: new Icon(
                            Icons.add_shopping_cart,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  new Hero(
                    tag: product.type,
                    child: new Image.asset(
                      product.imageUrl,
                      width: 350,
                      height: 300,
                    ),
                  ),
                  new SizedBox(
                    height: 50,
                  ),
                  new Text(
                    product.name,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  new SizedBox(
                    height: 30,
                  ),
                  new Text(
                    'Top fuel 9.9 XX1 AXS is top tiew full auto'
                    'suspension carbon mountain bike',
                    style: new TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  new SizedBox(
                    height: 30,
                  ),
                  new Text(
                    "It's also spec'd with high-end ROCK shox"
                    "Suspension and lots of carbon-inclusing"
                    "the wheels,bars, and shift levers. you'll fly"
                    "this bike",
                    style: new TextStyle(),
                  ),
                  new SizedBox(
                    height: 20,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "\$${product.price}",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      new FlatButton(
                        child: new Text('Add to Card'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
