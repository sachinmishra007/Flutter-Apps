import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/model/imageModel.dart';

class TechnologyStack extends StatefulWidget {
  final TechnologyStackModel technologyStack;
  TechnologyStack({Key key, this.technologyStack}) : super(key: key);
  @override
  _TechnologyStackState createState() => _TechnologyStackState();
}

class _TechnologyStackState extends State<TechnologyStack> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return new Container(
      width: width * .5,
      height: 170,
      child: Padding(
        padding: new EdgeInsets.only(left: 20, right: 20, top: 10),
        child: InkWell(
          onTap: () {
            print("Example");
          },
          child: Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(15),
              color: new Color(0xFF511845).withOpacity(0.5),
              border: Border.all(color: Colors.yellow.withOpacity(.5)),
            ),
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        new NetworkImage(widget.technologyStack.imageUrl),
                  ),
                ),
                new Text(
                  widget.technologyStack.stackName,
                  style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
