// To parse this JSON data, do
//
//     final citiesResponse = citiesResponseFromJson(jsonString);

import 'dart:convert';

List<CitiesResponse> citiesResponseFromJson(String str) => List<CitiesResponse>.from(json.decode(str).map((x) => CitiesResponse.fromJson(x)));

String citiesResponseToJson(List<CitiesResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CitiesResponse {
  CitiesResponse({
    required this.id,
    required this.playgrounds,
    required this.cityName,
    required this.governorate,
    required this.numberOfPlaygrounds,
  });

  String id;
  List<String> playgrounds;
  String cityName;
  String governorate;
  int numberOfPlaygrounds;

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
    id: json["id"],
    playgrounds: List<String>.from(json["playgrounds"].map((x) => x)),
    cityName: json["city_name"],
    governorate: json["governorate"],
    numberOfPlaygrounds: json["number_of_playgrounds"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "playgrounds": List<dynamic>.from(playgrounds.map((x) => x)),
    "city_name": cityName,
    "governorate": governorate,
    "number_of_playgrounds": numberOfPlaygrounds,
  };
}
