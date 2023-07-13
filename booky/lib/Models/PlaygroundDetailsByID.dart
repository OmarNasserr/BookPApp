// To parse this JSON data, do
//
//     final playgroundDetailsById = playgroundDetailsByIdFromJson(jsonString);

import 'dart:convert';

PlaygroundDetailsById playgroundDetailsByIdFromJson(String str) => PlaygroundDetailsById.fromJson(json.decode(str));

String playgroundDetailsByIdToJson(PlaygroundDetailsById data) => json.encode(data.toJson());

class PlaygroundDetailsById {
  PlaygroundDetailsById({
    required this.id,
    required this.governorate,
    required this.pName,
    required this.openTime,
    required this.closeTime,
    required this.totalAvailableTime,
    required this.description,
    required this.pricePerHour,
    required this.city,
    required this.playgroundOwner,
    required this.images,
    required this.hoursAvaialble,
  });

  String id;
  String governorate;
  String pName;
  String openTime;
  String closeTime;
  String totalAvailableTime;
  String description;
  double pricePerHour;
  String city;
  String playgroundOwner;
  List<Image> images;
  List<String> hoursAvaialble;

  factory PlaygroundDetailsById.fromJson(Map<String, dynamic> json) => PlaygroundDetailsById(
    id: json["id"],
    governorate: json["governorate"],
    pName: json["p_name"],
    openTime: json["open_time"],
    closeTime: json["close_time"],
    totalAvailableTime: json["total_available_time"],
    description: json["description"],
    pricePerHour: json["price_per_hour"],
    city: json["city"],
    playgroundOwner: json["playground_owner"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    hoursAvaialble: List<String>.from(json["hours_available"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "governorate": governorate,
    "p_name": pName,
    "open_time": openTime,
    "close_time": closeTime,
    "total_available_time": totalAvailableTime,
    "description": description,
    "price_per_hour": pricePerHour,
    "city": city,
    "playground_owner": playgroundOwner,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "hours_available": List<dynamic>.from(hoursAvaialble.map((x) => x)),
  };
}

class Image {
  Image({
    required this.id,
    required this.image,
    required this.thumbnail,
  });

  String id;
  String image;
  bool thumbnail;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    image: json["image"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "thumbnail": thumbnail,
  };
}
