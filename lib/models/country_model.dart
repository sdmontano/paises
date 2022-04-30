import 'package:flutter/foundation.dart';

import 'flag_model.dart';

// Modelo de los paises

class CountryModel {
  String name;
  String capital;
  Flag flags;
  List<dynamic> latlng;
  String region;
  int population;
  // List<dynamic> currencies;
  // List<dynamic> lenguages;

  // List? borders;

  CountryModel({
    required this.name,
    required this.capital,
    required this.flags,
    required this.latlng,
    required this.region,
    required this.population,
    // required this.currencies,
    // required this.lenguages
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      flags: Flag.fromJson(json['flags']),
      capital: json['capital'],
      latlng: json['latlng'],
      region: json['region'],
      population: json['population'],
    );
  }
}

class CountryList {
  final List<CountryModel> countries = new List.empty(growable: true);

  CountryList();

  CountryList.fromJsonList(List<dynamic> parsedJson) {
    if (parsedJson == null) return;

    for (var item in parsedJson) {
      final countryList = CountryModel.fromJson(item);
      countries.add(countryList);
    }
  }
}
