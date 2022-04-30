import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paises/models/country_model.dart';

class CountryService {
  // Consumo de la API

  String url = 'restcountries.com';

  Future<List<CountryModel>> getData() async {
    var uri = Uri.https(url, '/v2/all');
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      //print(resp.body);
      final decodedData = json.decode(resp.body);
      final countries = new CountryList.fromJsonList(decodedData);

      print(countries.countries[2]);

      return countries.countries;
    } else {
      print('error from server');
      throw Exception('Error');
    }
  }

  Future getByname(String name) async {
    var uri = Uri.https(url, '/v2/name/$name');
    final resp = await http.get(uri);

    final decodedData = json.decode(resp.body);

    final List<dynamic> countryList = decodedData;

    return countryList.map((obj) => CountryModel.fromJson(obj)).toList();
  }
}
