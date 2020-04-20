import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningApp/constants/constant.dart';
import 'package:learningApp/customWidget/mainCardChild/child.dart';
import 'package:learningApp/model/imageModel.dart';

class CardMainContent extends StatefulWidget {
  final CardMainContentModel cardMainContentModel;
  CardMainContent({Key key, this.cardMainContentModel}) : super(key: key);
  @override
  _CardMainContentState createState() => _CardMainContentState();
}

class _CardMainContentState extends State<CardMainContent> {
  List<Widget> _getCardChildItems() {
    List<Widget> _listOfCardItem = new List<Widget>();
    if (widget.cardMainContentModel.listCardContentItems != null) {
      for (int i = 0;
          i < widget.cardMainContentModel.listCardContentItems.length;
          i++) {
        _listOfCardItem.add(
          CardChildItems(
            childItemDescription:
                widget.cardMainContentModel.listCardContentItems[i],
          ),
        );
      }
    }
    return _listOfCardItem;
  }

  List<Widget> _getLoadingIndicator(widget) {
    List<Widget> _list = [];
    for (int i = 0; i < 5; i++) {
      _list.add(
        Container(
          height: 20,
          decoration: new BoxDecoration(
            color: new Color(0xFFffb6b6),
            borderRadius: new BorderRadius.circular(5),
          ),          
        ),
      );
      _list.add(
        SizedBox(
          height: 10,
        ),
      );
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: subTitleContainerPadding,
        right: subTitleContainerPadding,
      ),
      child: new Column(
        children: <Widget>[
          if (widget.cardMainContentModel.cardSubheaderTitle != null)
            new Container(
                decoration: new BoxDecoration(
                  color: cardSubheaderColor,
                ),
                width: widget.cardMainContentModel.parentWidth,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: new EdgeInsets.all(10),
                      child: new Text(
                        widget.cardMainContentModel.cardSubheaderTitle,
                        style: GoogleFonts.ubuntu(
                          color: mainTitleColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (widget.cardMainContentModel.openUrl != null)
                      Padding(
                        padding: new EdgeInsets.only(
                          right: 10,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: new Icon(
                            Icons.open_in_new,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ],
                )),
          if (widget.cardMainContentModel.imageDetails != null &&
              widget.cardMainContentModel.imageDetails.imageUrl != null)
            new Container(
              child: Padding(
                padding: new EdgeInsets.all(8),
                child: new Image.network(
                  widget.cardMainContentModel.imageDetails.imageUrl,
                  fit: BoxFit.fill,
                  height:
                      widget.cardMainContentModel.imageDetails.height != null
                          ? widget.cardMainContentModel.imageDetails.height
                          : 150,
                  width: widget.cardMainContentModel.imageDetails.width != null
                      ? widget.cardMainContentModel.imageDetails.width
                      : widget.cardMainContentModel.parentWidth,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return new Container(
                      height: widget.cardMainContentModel.imageDetails.height !=
                              null
                          ? widget.cardMainContentModel.imageDetails.height
                          : 150,
                      width:
                          widget.cardMainContentModel.imageDetails.width != null
                              ? widget.cardMainContentModel.imageDetails.width
                              : widget.cardMainContentModel.parentWidth,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _getLoadingIndicator(widget)),
                    );
                  },
                ),
              ),
            ),
          new Container(
            decoration: new BoxDecoration(
              color: childSubTitleColor,
              borderRadius: new BorderRadius.only(
                bottomRight: new Radius.circular(subtitleBorderRadius),
                bottomLeft: new Radius.circular(subtitleBorderRadius),
              ),
            ),
            width: widget.cardMainContentModel.parentWidth,
            child: new Column(
              children: _getCardChildItems(),
            ),
          ),
        ],
      ),
    );
  }
}
