import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/constants/constant.dart';
import 'package:learningApp/customWidget/button.dart';
import 'package:learningApp/pages/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInputWidget extends StatefulWidget {
  @override
  _UserInputWidgetState createState() => _UserInputWidgetState();
}

class _UserInputWidgetState extends State<UserInputWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController textEditController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    SharedPreferences userPrefrence;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double imageHeight = 300;
    double imageWidth = 300;
    double sizeHeight = 50;
    if (height <= 569) {
      imageWidth = 200;
      imageHeight = 200;
      sizeHeight = 50;
    } else if (height > 569 && height < 830) {
      imageWidth = 300;
      imageHeight = 300;
      sizeHeight = 80;
    } else if (height > 830) {
      imageWidth = 400;
      imageHeight = 400;
      sizeHeight = 100;
    }

    Future<Null> setUserName(String username) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username);
    }

    // double
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        body: MediaQuery(
          data: new MediaQueryData(),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: new Container(
                width: width,
                height: height,
                decoration: new BoxDecoration(color: primarybgColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 80, bottom: 20),
                        child: new Container(
                          height: imageHeight,
                          width: imageWidth,
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                                image: new AssetImage('assets/images/user.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Padding(
                        padding: new EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: new TextField(
                          controller: textEditController,
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.white)),
                            hintText: 'Tell me your name',
                            // helperText: 'Keep it short, this is just a demo.',
                            hintStyle: GoogleFonts.ubuntu(
                              color: Colors.white.withOpacity(
                                .5,
                              ),
                            ),
                            // labelText: 'Life story',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            prefixText: ' ',
                            // suffixText: 'USD',
                            // suffixStyle: const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: sizeHeight,
                    ),
                    InkWell(
                      onTap: () {
                        if (textEditController == null ||
                            textEditController.text.toString() == "") {
                          final snackBar = SnackBar(
                            content: Text('name is missing'),
                          );
                          _scaffoldKey.currentState.showSnackBar(snackBar);
                          // Scaffold.of(context).showSnackBar(snackBar);
                        } else {
                          if (textEditController.text.length > 14) {
                            textEditController.text =
                                textEditController.text.substring(0, 7) + "...";
                            setUserName(textEditController.text);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPageList(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: width,
                        child: CustomButton(
                          buttonTitle: "Let\'s Begin",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
