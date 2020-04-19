import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/constants/constant.dart';

class CardChildItems extends StatefulWidget {
  final String childItemDescription;
  CardChildItems({Key key, @required this.childItemDescription})
      : super(key: key);
  @override
  _CardChildItemsState createState() => _CardChildItemsState();
}

class _CardChildItemsState extends State<CardChildItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 6, right: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: new Text(
          widget.childItemDescription,
          textAlign: TextAlign.justify,
          style: GoogleFonts.ubuntu(
            color: mainTitleColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
