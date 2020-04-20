import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/constants/constant.dart';
import 'package:learningApp/customWidget/customDivider.dart';
import 'package:learningApp/customWidget/pageListing.dart';
import 'package:learningApp/enums/ConnectivityStatus.dart';
import 'package:learningApp/main.dart';
import 'package:learningApp/model/imageModel.dart';
import 'package:http/http.dart' as http;
import 'package:learningApp/pages/nointernet.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPageList extends StatefulWidget {
  @override
  _MainPageListState createState() => _MainPageListState();
}

class _MainPageListState extends State<MainPageList> {
  Future<List<PageListingModel>> _techStackList;
  String username = "";
  void getClickIndex(context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TechContentLisiting(
          title: "Learning App",
        ),
      ),
    );
  }

  List<Widget> _getGridWidgetList(context, data) {
    List<Widget> _listWidget = new List<Widget>();
    for (int i = 0; i < data.length; i++) {
      _listWidget.add(
        InkWell(
          onTap: () => getClickIndex(context, i),
          child: TechnologyPageListing(
            pageListingModel: new PageListingModel(
              backgroundColor: data[i].backgroundColor,
              articleCount: data[i].articleCount,
              techImageUrl: data[i].techImageUrl,
              techName: data[i].techName,
              techDescription: data[i].techDescription,
            ),
          ),
        ),
      );
    }
    return _listWidget;
  }

  void initState() {
    getUserInfo();
    _techStackList = getTechnologyStack();
    super.initState();
  }

  void getUserInfo() async {
    final userPreference = await SharedPreferences.getInstance();
    final String userName = userPreference.getString("username");
    setState(() {
      username = userName;
    });
    print(username);
  }

  Future<List<PageListingModel>> getTechnologyStack() async {
    List<PageListingModel> _techStackList = [];
    final response = await http.get(stackUrl);
    if (response.statusCode == 200) {
      var techStack = jsonDecode(response.body) as List;
      _techStackList = techStack
          .map((teckStack) => PageListingModel.fromJson(teckStack))
          .toList();
    } else {
      print("------- Error Occured ------------");
    }
    return _techStackList;
  }

  @override
  Widget build(BuildContext context) {
    const fontColor = Colors.white;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = 6.0;
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (height > 850) {
      aspectRatio = 6;
    } else if (height < 850) {
      aspectRatio = 5.5;
    }

    return Scaffold(
      body: connectionStatus == ConnectivityStatus.Offline
          ? NoInternetConnection()
          : new Container(
              width: width,
              height: height,
              decoration: new BoxDecoration(color: primarybgColor),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Top header bar creation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            top: 80,
                          ),
                          child: new Text(
                            'Hi, ' + username.toString(),
                            style: GoogleFonts.ubuntu(
                              color: fontColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 80,
                            right: 15,
                          ),
                          child: InkWell(
                            onTap: () {
                              print("Clicked On Notifcation");
                            },
                            child: new Icon(
                              Icons.notification_important,
                              color: fontColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 15,
                      ),
                      child: new Text(
                        'Welcome to Learning Technology',
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        right: 10,
                        left: 10,
                        top: 25,
                      ),
                      child: new Container(
                        width: width,
                        height: 150,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: new Border.all(
                              width: .7,
                              color: Color(0xFF4f3961).withOpacity(.8)),
                          image: new DecorationImage(
                            colorFilter: new ColorFilter.mode(
                                Color(0xFF511845).withOpacity(0.5),
                                BlendMode.dstATop),
                            image: AssetImage(
                              "assets/images/back-ground.png",
                            ),
                          ),
                        ),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, top: 10),
                                child: new Text(
                                  'Technology Stack',
                                  style: GoogleFonts.ubuntu(
                                    color: Color(0xFFf2ed6f),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text(
                                        'Explore',
                                        style: GoogleFonts.ubuntu(
                                          color: Color(0xFFe7d39f),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 5,
                                      ),
                                      new Text(
                                        'Learn new technology stacks with us.',
                                        style: GoogleFonts.ubuntu(
                                          color: Color(0xFFe7d39f),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    FutureBuilder<List<PageListingModel>>(
                      future: _techStackList,
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: GridView.count(
                              crossAxisCount: 3,
                              // padding: EdgeInsets.all(4.0),
                              childAspectRatio: aspectRatio / 9.0,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children:
                                  _getGridWidgetList(context, snapshot.data),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(
                              top: 60,
                            ),
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    new SizedBox(
                      height: 10,
                    ),
                    CustomDividerWidget(),
                    new Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: new Text(
                              'New to Technology ? Here are few ',
                              style: GoogleFonts.ubuntu(
                                color: Color(0xFFe7d39f),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                print("Inkwell on Link");
                              },
                              child: new Text(
                                'FAQ' 's',
                                style: GoogleFonts.ubuntu(
                                  color: Color(0xFFf0a500),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomDividerWidget(),
                    new SizedBox(
                      height: 15,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: new Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: new Text(
                                "Action comes about if and only if we find a discrepancy between what we are experiencing and what we want to experience.",
                                style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
