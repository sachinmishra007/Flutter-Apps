import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/model/imageModel.dart';

class TechnologyPageListing extends StatefulWidget {
  final PageListingModel pageListingModel;

  TechnologyPageListing({Key key, this.pageListingModel}) : super(key: key);
  @override
  _TechnologyPageListingState createState() => _TechnologyPageListingState();
}

class _TechnologyPageListingState extends State<TechnologyPageListing> {
  Color defaultColor = Color(0xFFd2c6b2);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double sizedBox = 10.0;
    double fontSize = 18.0;
    double innerSizedBox = 5.0;
    if (height > 850) {
      sizedBox = 30;
      innerSizedBox = 10;
      fontSize = 18;
    } else if (height < 850 && height > 740) {
      sizedBox = 10;
      innerSizedBox = 5;
      fontSize = 18;
    } else if (height < 740) {
      sizedBox = 5;
      innerSizedBox = 1;
      fontSize = 15;
    }

    return GridTile(
      child: Center(
        child: new Container(
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          decoration: new BoxDecoration(
              border: new Border.all(
                  color: Color(0xFfffd3b6).withOpacity(.3), width: .7),
              color: widget.pageListingModel.backgroundColor != null
                  ? widget.pageListingModel.backgroundColor
                  : Colors.transparent,
              borderRadius: new BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new SizedBox(
                height: sizedBox,
              ),
              Center(
                child: new Text(
                  widget.pageListingModel.techName,
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              new SizedBox(
                height: innerSizedBox,
              ),
              Center(
                child: Image.network(
                  widget.pageListingModel.techImageUrl,
                  height: 70,
                  width: 70,
                ),
              ),
              new SizedBox(
                height: innerSizedBox,
              ),
              Center(
                child: new Text(
                  widget.pageListingModel.articleCount.toString() + "+",
                  style: GoogleFonts.ubuntu(
                    color: Color(0xFFfafba4),
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              new SizedBox(
                width: innerSizedBox,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: new Text(
                    widget.pageListingModel.techDescription,
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
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
