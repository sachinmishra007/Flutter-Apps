import 'dart:ui';

class CardImageModel {
  final String imageUrl;
  final double width;
  final double height;

  CardImageModel({this.imageUrl, this.height, this.width});
}

class CardHeaderModelDetail {
  final String technologyIconPath;
  final double parentWidth;
  final String title1;
  final String title2;

  CardHeaderModelDetail({
    this.technologyIconPath,
    this.parentWidth,
    this.title1,
    this.title2,
  });
}

class CardMainTitleModel {
  final String mainTitle;
  final double parentWidth;
  final bool isVisible;
  final String label;
  CardMainTitleModel(
      {this.mainTitle, this.parentWidth, this.isVisible, this.label});
}

class CardMainContentModel {
  final double parentWidth;
  final String cardSubheaderTitle;
  final String openUrl;
  final List<String> listCardContentItems;
  final CardImageModel imageDetails;
  CardMainContentModel(
      {this.parentWidth,
      this.cardSubheaderTitle,
      this.listCardContentItems,
      this.openUrl,
      this.imageDetails});
}

class CardDetails {
  final double parentWidth;
  final CardHeaderModelDetail cardHeaderModelDetail;
  final CardMainTitleModel cardMainTitleModel;
  final List<CardMainContentModel> cardMainContentModel;

  CardDetails(
      {this.parentWidth,
      this.cardHeaderModelDetail,
      this.cardMainContentModel,
      this.cardMainTitleModel});
}

class TechnologyStackModel {
  final String imageUrl;
  final String stackName;
  TechnologyStackModel({this.imageUrl, this.stackName});
}

class PageListingModel {
  final int index;
  final String techImageUrl;
  final String techName;
  final String techDescription;
  final Color backgroundColor;
  final int articleCount;

  factory PageListingModel.fromJson(Map<String, dynamic> json) {
    return PageListingModel(
      articleCount: json["articleCount"],
      techImageUrl: json["techImageUrl"],
      techName: json["techName"],
      backgroundColor: Color(int.parse(json["backgroundColor"])),
      techDescription: json["techDescription"],
    );
  }

  PageListingModel(
      {this.techImageUrl,
      this.articleCount,
      this.index,
      this.techName,
      this.techDescription,
      this.backgroundColor});
}
