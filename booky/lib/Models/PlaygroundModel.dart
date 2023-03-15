// To parse this JSON data, do
//
//     final nearestPlaygroundResponse = nearestPlaygroundResponseFromJson(jsonString);

import 'dart:convert';

List<PlaygroundResponse> playgroundResponseFromJson(String str) =>List<PlaygroundResponse>.from(
        json.decode(str).map((x) => PlaygroundResponse.fromJson(x)));

String nearestPlaygroundResponseToJson(List<PlaygroundResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlaygroundResponse {
  PlaygroundResponse({
    required this.id,
    required this.governorate,
    required this.images,
    required this.pName,
    required this.openTime,
    required this.closeTime,
    required this.totalAvailableTime,
    required this.description,
    required this.pricePerHour,
    required this.city,
    required this.playgroundOwner,
  });

  String id;
  String governorate;
  List<Image> images;
  String pName;
  String openTime;
  String closeTime;
  String totalAvailableTime;
  String description;
  double pricePerHour;
  String city;
  String playgroundOwner;

  factory PlaygroundResponse.fromJson(Map<String, dynamic> json) =>
      PlaygroundResponse(
        id: json["id"],
        governorate: json["governorate"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        pName: json["p_name"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        totalAvailableTime: json["total_available_time"],
        description: json["description"],
        pricePerHour: json["price_per_hour"],
        city: json["city"],
        playgroundOwner: json["playground_owner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "governorate": governorate,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "p_name": pName,
        "open_time": openTime,
        "close_time": closeTime,
        "total_available_time": totalAvailableTime,
        "description": description,
        "price_per_hour": pricePerHour,
        "city": city,
        "playground_owner": playgroundOwner,
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
