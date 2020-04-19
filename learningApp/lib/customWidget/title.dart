import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/constants/constant.dart';
import 'package:learningApp/model/imageModel.dart';

class CardMainTitle extends StatefulWidget {
  final CardMainTitleModel cardMainTitleModel;
  CardMainTitle({Key key, @required this.cardMainTitleModel}) : super(key: key);

  _CardMainTitleState createState() => _CardMainTitleState();
}

class _CardMainTitleState extends State<CardMainTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: subTitleContainerPadding,
        right: subTitleContainerPadding,
      ),
      child: new Container(
        decoration: new BoxDecoration(
          color: subTitleColor,
          borderRadius: new BorderRadius.only(
            topLeft: new Radius.circular(subtitleBorderRadius),
            topRight: new Radius.circular(subtitleBorderRadius),
          ),
        ),
        width: widget.cardMainTitleModel.parentWidth,
        child: Padding(
          padding: const EdgeInsets.only(
            left: subTitlePadding,
            top: subTitlePadding,
            bottom: subTitlePadding,
          ),
          child: new Text(
            widget.cardMainTitleModel.mainTitle,
            style: GoogleFonts.ubuntu(
              color: mainTitleColor,
              fontSize: 20,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
