import 'package:flutter/material.dart';
import 'package:futter_chairs/animation-pages/easingAnimationWidget.dart';
import 'package:futter_chairs/animation-pages/maskingAnimationWidget.dart';
import 'package:futter_chairs/animation-pages/offsetDelayAnimationWidget.dart';
import 'package:futter_chairs/animation-pages/parentinganimation.dart';
import 'package:futter_chairs/animation-pages/transformationanimationwidget.dart';
import 'package:futter_chairs/animation-pages/valueChangeAnimationWidget.dart';
import 'package:futter_chairs/common/common.dart';

class AnimationLearningPage extends StatefulWidget {
  @override
  _AnimationLearningPageState createState() => _AnimationLearningPageState();
}

class _AnimationLearningPageState extends State<AnimationLearningPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: CommonConstants.primaryColor,
        title: new Text(
          'Explore Flutter Animation',
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: Icon(
              Icons.airplanemode_active,
              color: Colors.black87,
            ),
            title: new Text(
              'Easing Animation',
              style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) {
                    return new EasingAnimationWidget();
                  },
                ),
              );
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.done_all,
              color: Colors.black87,
            ),
            title: new Text(
              'Offset Delay Animation',
              style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) {
                    return new OffsetDelayAnimationWidget();
                  },
                ),
              );
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.party_mode,
              color: Colors.black87,
            ),
            title: new Text(
              'Parenting Animation',
              style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) {
                    return new ParetingAnimationWidget();
                  },
                ),
              );
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.black87,
            ),
            title: new Text(
              'Transformation Animation',
              style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) {
                    return new TransformationAnimationWidget();
                  },
                ),
              );
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.perm_media,
              color: Colors.black87,
            ),
            title: new Text(
              'Value Change Animation',
              style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) {
                    return new ValueChangeAnimationWidget();
                  },
                ),
              );
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.mobile_screen_share,
              color: Colors.black87,
            ),
            title: new Text(
              'Masking Animation',
              style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) {
                    return new MaskingAnimationWidget();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
