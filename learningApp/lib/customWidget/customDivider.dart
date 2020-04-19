import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Divider(
        color: Color(0xFFf5b971).withOpacity(.5),
        thickness: .4,
      ),
    );
  }
}
