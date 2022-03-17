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

// import 'package:flutter/material.dart';
// import 'api_networking.dart';
// import 'main.dart';

void func() {
  network.getData;
  // print(network.countryName);
  // print(network.countryCapital);
  // print(network.countryName);
}

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Display(),
    );
  }
}

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    func();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(child: Text('ISO Code $inputISOquery')),
          Container(child: Text(network.countryName)),
          Container(child: Text(network.countryCapital))
        ],
      )),
    );
  }
}
