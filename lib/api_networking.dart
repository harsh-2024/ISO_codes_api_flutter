import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';

class Network {
  var countryName = " ";

  var countryCapital = " ";

  void getData() async {
    String query = inputISOquery;
    http.Response response = await http.get(
        Uri.parse('https://wft-geo-db.p.rapidapi.com/v1/geo/countries/$query'),
        headers: {
          'x-rapidapi-host': 'wft-geo-db.p.rapidapi.com',
          'x-rapidapi-key': '228b639b3bmsha3d5a2853287f8fp12033djsn1ec5e589b9bc'
        });
    if (response.statusCode == 200) {
      // print(response.body);
      countryName = jsonDecode(response.body)["data"]["name"];
      // print(query);
      // print(countryName);

      countryCapital = jsonDecode(response.body)["data"]["capital"];
      // print(countryCapital);

    } else {
      print('errorFetchingDetails');
    }
  }
}
