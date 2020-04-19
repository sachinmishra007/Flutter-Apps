import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/constants/constant.dart';
import 'package:learningApp/customWidget/button.dart';
import 'package:learningApp/enums/ConnectivityStatus.dart';
import 'package:provider/provider.dart';

class NoInternetConnection extends StatefulWidget {
  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double imagehw = 300;
    if (height < 740) {
      imagehw = 200;
    } else if (height > 740 && height < 820) {
      imagehw = 300;
    } else if (height > 820) {
      imagehw = 420;
    }

    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          color: primarybgColor,
        ),
        height: height,
        width: width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: new Container(
                      height: imagehw,
                      width: imagehw,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage(
                            "assets/images/newimage.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                new SizedBox(
                  height: 45,
                ),
                Center(
                  child: new Text(
                    'No Internet Connection',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 25),
                  ),
                ),
                new SizedBox(
                  height: 40,
                ),
                Center(
                  child: new Text(
                    'No Internet Connection found.',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(.6),
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                new SizedBox(
                  height: 8,
                ),
                Center(
                  child: new Text(
                    'Please check your internet Seetings.',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(.6),
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                new SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    if (connectionStatus == ConnectivityStatus.Offline) {
                      final snackBar = SnackBar(
                        content: Text('Oops ! You are sill offline '),
                      );

                      // Find the Scaffold in the widget tree and use
                      // it to show a SnackBar.
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: CustomButton(
                    buttonTitle: "Try again",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
