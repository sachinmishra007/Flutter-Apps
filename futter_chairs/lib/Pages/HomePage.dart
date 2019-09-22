import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_chairs/Data/data.dart';
import 'package:futter_chairs/Pages/ProductDetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;

  AnimationController _controller;
  Animation<double> _leftAnim;
  Animation<double> _rightAnim;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: new Duration(milliseconds: 1000),
      vsync: this,
    );

    _leftAnim = new Tween(begin: -220.0, end: 30.0).animate(
      new CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: _controller,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print('Completed');
        }
      });

    _rightAnim = new Tween(begin: 400.0, end: 30.0).animate(
      new CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: _controller,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print('Completed');
        }
      });

    super.initState();
    _controller.forward();
  }

  Widget _buildGradientContainer(double width, double height) {
    return new Align(
      alignment: Alignment.topRight,
      child: new Container(
        width: width * .7,
        height: height / 2,
        // color: Colors.red,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Colors.pink,
              Colors.black45,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.7, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return new Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHeight(double height) {
    return new AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return new Positioned(
            top: height * .2,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  // transform: Matrix4.translationValues(-220.0, 0.0, 0.0),
                  transform: Matrix4.translationValues(
                    _leftAnim.value,
                    0.0,
                    0.0,
                  ),
                  child: new Text(
                    'Wooden Chair',
                    style: new TextStyle(
                      color: Colors.black45.withOpacity(.7),
                      fontWeight: FontWeight.normal,
                      fontSize: 35,
                      fontFamily: "Montserrat-Bold",
                    ),
                  ),
                ),
                new Container(
                  // transform: Matrix4.translationValues(400.0, 0.0, 0.0),
                  transform:
                      Matrix4.translationValues(_rightAnim.value, 0.0, 0.0),
                  child: new Text(
                    'New Wooden Relaxing Chair',
                    style: new TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat-Bold",
                      color: Colors.black45.withOpacity(.7),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFf2f3f8),
      body: new LayoutBuilder(
        builder: (context, constraint) {
          var width = constraint.maxWidth;
          var height = constraint.maxHeight;
          return new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildGradientContainer(width, height),
              _buildAppBar(),
              _buildHeight(height),
              new Align(
                alignment: Alignment.bottomCenter,
                child: new SizedBox(
                  height: height * .5,
                  child: new ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return new Padding(
                        padding: const EdgeInsets.only(left: 35, bottom: 50),
                        child: new GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              new MaterialPageRoute(builder: (context) {
                                return new ProductDetails(indexItem: index);
                              }),
                            );
                          },
                          child: new SizedBox(
                            width: 200.0,
                            child: new Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                new Padding(
                                  padding: const EdgeInsets.only(top: 45),
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                      color: index % 2 == 0
                                          ? Colors.white
                                          : Color(0xFF2a2d3f),
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0.0, 14.0),
                                          blurRadius: 10.0,
                                        )
                                      ],
                                      borderRadius:
                                          new BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(30),
                                      child: new Image.asset(
                                        images[index],
                                        width: 150.5,
                                        height: 172.0,
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 1.0,
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Text(
                                            title[index],
                                            style: new TextStyle(
                                              fontFamily: 'Montserrat-Bold',
                                              fontSize: 16.0,
                                              color: index % 2 == 0
                                                  ? Color(0xFF2a2d3f)
                                                  : Colors.white,
                                            ),
                                          ),
                                          new SizedBox(
                                            height: 8.0,
                                          ),
                                          new Text(
                                            'New Sell',
                                            style: new TextStyle(
                                              fontSize: 12.0,
                                              color: index % 2 == 0
                                                  ? Color(0xFF2a2d3f)
                                                  : Colors.white,
                                            ),
                                          ),
                                          new SizedBox(
                                            height: 5.0,
                                          ),
                                          new Text(
                                            price[index] + " \$",
                                            style: new TextStyle(
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold,
                                              color: index % 2 == 0
                                                  ? Color(0xFF2a2d3f)
                                                  : Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
        selectedItemColor: Colors.black,
        onTap: (index) {
          // print("Index= : " + index.toString());
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.panorama_horizontal),
            title: new Container(
              height: 0.0,
            ),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.bookmark_border),
            title: new Container(
              height: 0.0,
            ),
          )
        ],
      ),
      floatingActionButton: new Container(
        width: 65.0,
        height: 65.0,
        decoration: new BoxDecoration(
          color: new Color(0xFFfa7b58),
          shape: BoxShape.circle,
          boxShadow: [
            new BoxShadow(
              color: new Color(0xFFf78a6c).withOpacity(.5),
              offset: Offset(0.0, 10.0),
              blurRadius: 10.0,
            )
          ],
        ),
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          child: new Icon(
            Icons.add,
            size: 35.0,
            color: Colors.yellow,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
