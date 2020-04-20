import 'dart:convert';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:learningApp/constants/constant.dart';
import 'package:learningApp/customWidget/mainCardContent.dart';
import 'package:learningApp/pages/mainpage.dart';
import 'package:learningApp/pages/nointernet.dart';
import 'package:learningApp/pages/onboarding.dart';
import 'package:learningApp/pages/userInput.dart';
import 'package:learningApp/services/ConnectivityService.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums/ConnectivityStatus.dart';
import 'model/imageModel.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    DevicePreview(builder: (context) => MyApp()),
  );
}

// MainPageList()
class MyApp extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      builder: (context) => ConnectivityService().connectionStatusController,
      child: MaterialApp(
        locale: DevicePreview.of(context).locale, // <--- Add the locale
        builder: DevicePreview.appBuilder,
        title: 'Learning Cheatsheet',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: OnBoardingWidget() //sOnBoardingWidget() //MainPageList()
        ,
      ),
    );
  }
}

class TechContentLisiting extends StatefulWidget {
  TechContentLisiting({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TechContentLisitingState createState() => _TechContentLisitingState();
}

class _TechContentLisitingState extends State<TechContentLisiting> {
  void initState() {
    super.initState();
  }

  Future<List<CardDetails>> getStackInfo(double height, double width) async {
    List<CardDetails> cardDetails = [];
    final response = await http.get(k8sUrl);
    if (response.statusCode == 200) {
      var techStack = jsonDecode(response.body);
      var technology = techStack["technology"];
      var data = techStack["data"];
      //Creating the Header
      var cardHeader = CardHeaderModelDetail(
          technologyIconPath: technology["technologyIconPath"],
          title1: technology["title1"],
          title2: technology["title2"],
          parentWidth: width);
      // Creating the data

      CardMainTitleModel _cardMainTitle;

      for (int i = 0; i < data.length; i++) {
        _cardMainTitle = CardMainTitleModel(
          mainTitle: data[i]["mainTitle"],
          isVisible: data[i]["isVisible"] == "true",
          label: data[i]["label"],
          parentWidth: width,
        );
        List<CardMainContentModel> _listCardModel = [];
        for (int j = 0; j < data[i]["cardContent"].length; j++) {
          _listCardModel.add(
            new CardMainContentModel(
              cardSubheaderTitle: data[i]["cardContent"][j]["subheaderTitle"],
              openUrl: data[i]["cardContent"][j]["openUrl"],
              imageDetails: new CardImageModel(
                imageUrl: data[i]["cardContent"][j]["image"]["imageUrl"],
                height: data[i]["cardContent"][j]["image"]["height"],
                width: data[i]["cardContent"][j]["image"]["width"],
              ),
              listCardContentItems:
                  getCardData(data[i]["cardContent"][j]["cardData"] as List),
            ),
          );
        }

        cardDetails.add(
          new CardDetails(
            cardHeaderModelDetail: cardHeader,
            cardMainTitleModel: _cardMainTitle,
            cardMainContentModel: _listCardModel,
          ),
        );
      }
    } else {
      print("------- Error Occured ------------");
    }
    return cardDetails;
  }

  List<String> getCardData(data) {
    List<String> _cardInfo = [];
    for (int i = 0; i < data.length; i++) {
      _cardInfo.add(data[i] as String);
    }
    return _cardInfo;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    List<Widget> _getMainContentWidget(List<CardDetails> cardData) {
      List<Widget> _widget = new List<Widget>();
      // Looking for the top most data for header

      for (int i = 0; i < cardData.length; i++) {
        var cardHeaderDetails =
            i == 0 ? cardData[i].cardHeaderModelDetail : null;
        var cardTitleDetails = cardData[i].cardMainTitleModel;
        var cardMainContentModel = cardData[i].cardMainContentModel;
        _widget.add(
          MainCardDetail(
            cardDetails: new CardDetails(
                cardHeaderModelDetail: cardHeaderDetails,
                cardMainTitleModel: cardTitleDetails,
                cardMainContentModel: cardMainContentModel),
          ),
        );
      }
      return _widget;
    }

    return Scaffold(
      body: connectionStatus == ConnectivityStatus.Offline
          ? NoInternetConnection()
          : FutureBuilder<List<CardDetails>>(
              future: getStackInfo(height, width),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return new Container(
                    width: width,
                    height: height,
                    decoration: new BoxDecoration(
                      color: backgroundColor.withOpacity(.9),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: new Column(
                        children: _getMainContentWidget(snapshot.data),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: width,
                    height: height,
                    decoration: new BoxDecoration(
                      color: Color(
                        0xFF511845,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
    );
  }
}
