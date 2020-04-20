import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/constants/constant.dart';
import 'package:learningApp/enums/ConnectivityStatus.dart';
import 'package:learningApp/pages/nointernet.dart';
import 'package:learningApp/pages/userInput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainpage.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  final int numPage = 3;
  String username = "";
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == _currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  void getUserInfo() async {
    final userPreference = await SharedPreferences.getInstance();
    final String userName = userPreference.getString("username");
    if (userName != null) {
      username = userName;
    }
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: new Duration(
        milliseconds: 150,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: new BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7851D3),
        borderRadius: new BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double imageHeight = 150;
    double imageWidth = 150;
    double containerHeight = 400;
    double fontWeight = 10;
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (height < 740) {
      imageHeight = 150;
      imageWidth = 150;
      containerHeight = 400;
      fontWeight = 10;
    } else if (height < 830 && height >= 740) {
      imageHeight = 250;
      imageWidth = 250;
      containerHeight = 600;
      fontWeight = 16;
    } else if (height >= 830) {
      imageHeight = 300;
      imageWidth = 300;
      containerHeight = 600;
      fontWeight = 20;
    }

    // if(height<)
    return connectionStatus == ConnectivityStatus.Offline
        ? NoInternetConnection()
        : username != ""
            ? MainPageList()
            : AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Container(
                  width: width,
                  height: height,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        primarybgColor,
                        Color(0xFF511845),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.clamp,
                      stops: [0.0, 1],
                    ),
                    color: primarybgColor,
                  ),
                  child: new Scaffold(
                    backgroundColor: Colors.transparent,
                    body: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserInputWidget()),
                              );
                            },
                            child: new Text(
                              'Skip',
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: containerHeight,
                          child: PageView(
                            physics: ClampingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (int pageIndex) {
                              setState(() {
                                _currentPage = pageIndex;
                              });
                            },
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(40),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: new Image(
                                        image: AssetImage(
                                            "assets/images/onboarding0.png"),
                                        height: imageHeight,
                                        width: imageWidth,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Text(
                                      'Connect people\naround the world',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry specimen book',
                                      style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontSize: fontWeight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(40),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: new Image(
                                          image: AssetImage(
                                              "assets/images/onboarding1.png"),
                                          height: imageHeight,
                                          width: imageWidth),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Text(
                                      'Live your life smarter\nwith us !',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry specimen book',
                                      style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontSize: fontWeight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(40),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: new Image(
                                        image: AssetImage(
                                            "assets/images/onboarding2.png"),
                                        height: imageHeight,
                                        width: imageWidth,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Text(
                                      'Great New experience\nof imagination',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry specimen book',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontSize: fontWeight,
                                          letterSpacing: 1.1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                        _currentPage != numPage - 1
                            ? Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: FractionalOffset.bottomRight,
                                  child: FlatButton(
                                    onPressed: () {
                                      _pageController.nextPage(
                                        duration:
                                            new Duration(milliseconds: 100),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Next',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 22.0,
                                              color: Colors.white),
                                        ),
                                        new SizedBox(
                                          width: 10,
                                        ),
                                        new Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Align(
                                  alignment: FractionalOffset.center,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return UserInputWidget();
                                      }));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Getting Started',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 22.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
