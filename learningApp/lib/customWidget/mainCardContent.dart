import 'package:flutter/material.dart';
import 'package:learningApp/customWidget/cardContent.dart';
import 'package:learningApp/customWidget/cardHeader.dart';
import 'package:learningApp/customWidget/title.dart';
import 'package:learningApp/model/imageModel.dart';

class MainCardDetail extends StatefulWidget {
  final CardDetails cardDetails;
  MainCardDetail({Key key, this.cardDetails}) : super(key: key);
  @override
  _MainCardDetailState createState() => _MainCardDetailState();
}

List<Widget> getWidgetList(mainWidget) {
  List<Widget> _widgetList = new List<Widget>();
  if (mainWidget.cardDetails.cardHeaderModelDetail != null) {
    _widgetList.add(new CardHeaderDetail(
        cardHeaderDetail: mainWidget.cardDetails.cardHeaderModelDetail));
  }
  if (mainWidget.cardDetails.cardMainTitleModel != null) {
    _widgetList.add(new CardMainTitle(
        cardMainTitleModel: mainWidget.cardDetails.cardMainTitleModel));
  }
  if (mainWidget.cardDetails.cardMainContentModel != null) {
    for (int i = 0;
        i < mainWidget.cardDetails.cardMainContentModel.length;
        i++) {
      _widgetList.add(new CardMainContent(
          cardMainContentModel:
              mainWidget.cardDetails.cardMainContentModel[i]));
    }
  }
  _widgetList.add(
    SizedBox(
      height: 20,
    ),
  );
  return _widgetList;
}

class _MainCardDetailState extends State<MainCardDetail> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: getWidgetList(widget),
    );
  }
}
