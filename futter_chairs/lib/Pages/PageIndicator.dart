import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  PageIndicator(this.currentIndex, this.pageCount);
  Widget _indicator(bool isActive) {
    return new Expanded(
      child: new Container(
        width: 14.0,
        height: 14.0,
        decoration: new BoxDecoration(
            color: isActive ? Colors.black : Color(0xFFb9bcca),
            shape: BoxShape.circle,
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 3.0),
                blurRadius: 3.0,
              )
            ]),
      ),
    );
  }

  _buildIndicator() {
    List<Widget> indicator = [];
    for (var i = 0; i < pageCount; i++) {
      indicator.add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicator;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildIndicator());
  }
}
