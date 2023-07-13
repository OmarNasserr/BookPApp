// To parse this JSON data, do
//
//     final sliderImage = sliderImageFromJson(jsonString);

import 'dart:convert';

SliderImage sliderImageFromJson(String str) => SliderImage.fromJson(json.decode(str));

String sliderImageToJson(SliderImage data) => json.encode(data.toJson());

class SliderImage {
  int status;
  dynamic next;
  dynamic previous;
  int totalNumberOfObjects;
  int numberOfPages;
  List<Result> results;

  SliderImage({
    required this.status,
    this.next,
    this.previous,
    required this.totalNumberOfObjects,
    required this.numberOfPages,
    required this.results,
  });

  List<String> getImageUrls() {
    return results.map((result) => result.image).toList();
  }
  factory SliderImage.fromJson(Map<String, dynamic> json) => SliderImage(
    status: json["status"],
    next: json["next"],
    previous: json["previous"],
    totalNumberOfObjects: json["total number of objects"],
    numberOfPages: json["number of pages"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "next": next,
    "previous": previous,
    "total number of objects": totalNumberOfObjects,
    "number of pages": numberOfPages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  String id;
  String image;

  Result({
    required this.id,
    required this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}
