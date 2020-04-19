import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/constants/constant.dart';
import 'package:learningApp/model/imageModel.dart';

class CardHeaderDetail extends StatefulWidget {
  final CardHeaderModelDetail cardHeaderDetail;
  CardHeaderDetail({Key key, this.cardHeaderDetail}) : super(key: key);
  @override
  _CardHeaderDetailState createState() => _CardHeaderDetailState();
}

class _CardHeaderDetailState extends State<CardHeaderDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(
              left: 10,
              top: 50,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: new Image.asset(
              widget.cardHeaderDetail.technologyIconPath,
              width: 89,
              height: 80,
            ),
          ),
          Padding(
            padding: new EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
              top: 5,
            ),
            child: new Container(
              width: widget.cardHeaderDetail.parentWidth,
              decoration: new BoxDecoration(
                  color: backgroundHeaderColor.withOpacity(.6),
                  borderRadius: new BorderRadius.circular(5)),
              child: new Column(
                children: <Widget>[
                  new Text(
                    widget.cardHeaderDetail.title1,
                    style: GoogleFonts.ubuntu(
                      color: mainTitleColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  new SizedBox(
                    height: 5,
                  ),
                  new Text(
                    widget.cardHeaderDetail.title2,
                    style: GoogleFonts.ubuntu(
                      color: mainTitleColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  new SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
