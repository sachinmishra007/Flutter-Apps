import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:futter_chairs/Data/data.dart';
import 'package:futter_chairs/Pages/PageIndicator.dart';

class ProductDetails extends StatefulWidget {
  final int indexItem;
  ProductDetails({@required this.indexItem});
  @override
  ProductDetailsState createState() =>
      new ProductDetailsState(indexItem: indexItem);
}

class ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  int indexItem = 0;
  int _currentIndexItem = 0;
  AnimationController _controller;
  Animation<double> titleAnim;
  Animation<double> tagAnim;
  Animation<double> priceAnim;
  Animation<double> imageAnim;

  ProductDetailsState({this.indexItem}) {
    _currentIndexItem = indexItem;
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: new Duration(milliseconds: 1500),
      vsync: this,
    );

    titleAnim = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.3),
      ),
    );

    tagAnim = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.5),
      ),
    );

    priceAnim = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.8),
      ),
    );

    imageAnim = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1),
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  void _peviousImage() {
    setState(() {
      if (_currentIndexItem > 0) {
        _currentIndexItem--;
        _controller.reset();
        _controller.forward();
      } else {
        _currentIndexItem = 0;
      }
    });
  }

  void _nextImage() {
    setState(() {
      if (_currentIndexItem < images.length - 1) {
        _currentIndexItem++;
        _controller.reset();
        _controller.forward();
      } else {
        _currentIndexItem = _currentIndexItem;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          height: MediaQuery.of(context).size.height,
          child: new Stack(
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ClipRRect(
                    borderRadius: new BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    ),
                    child: new SizedBox(
                      height: 500,
                      child: new Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          new Image.asset(
                            images[_currentIndexItem],
                            // fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                          new Positioned(
                            top: 50.0,
                            right: 50.0,
                            child: new Container(
                              child: Opacity(
                                opacity: priceAnim.value,
                                child: new Text(
                                  "\$ " + price[_currentIndexItem],
                                  style: new TextStyle(
                                    color: itemColor[_currentIndexItem],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Positioned(
                            top: 40.0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.topLeft,
                              // color: Colors.red,
                              child: new IconButton(
                                icon: new Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                          new Positioned(
                            top: 430.0,
                            left: 25.0,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Transform.translate(
                                  offset: new Offset(
                                    0.0,
                                    30 * (1 - titleAnim.value),
                                  ),
                                  child: new Opacity(
                                    opacity: titleAnim.value,
                                    child: new Text(
                                      title[_currentIndexItem],
                                      style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: tagAnim.value,
                                  child: new Text(
                                    "New Sell",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                new SizedBox(
                                  width: 70.0,
                                  height: 30,
                                  child: PageIndicator(
                                      _currentIndexItem, images.length),
                                ),
                              ],
                            ),
                          ),
                          new Positioned.fill(
                            child: new GestureDetector(
                              onHorizontalDragEnd: (DragEndDetails details) {
                                if (details.velocity.pixelsPerSecond.dx > 0) {
                                  _peviousImage();
                                } else if (details.velocity.pixelsPerSecond.dy <
                                    0) {
                                  _nextImage();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          'Wooden Armchairs',
                          style: new TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        new Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem "
                          "Ipsum has been the industry's standard dummy text ever since the 1500s, when an",
                          style: new TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              new Positioned(
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                  child: SizedBox(
                    width: 160,
                    height: 60.0,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            color: Color(0xFFfa7b58),
                            child: new Center(
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            color: Color(0xFF2a2d3f),
                            child: new Center(
                              child: Icon(
                                Icons.shopping_basket,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
