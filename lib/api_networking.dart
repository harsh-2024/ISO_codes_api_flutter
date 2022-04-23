import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

var countryName = " ";

var countryCapital = " ";

Future<Album> getData() async {
  String query = inputISOquery.toUpperCase();
  http.Response response = await http.get(
      Uri.parse('https://wft-geo-db.p.rapidapi.com/v1/geo/countries/$query'),
      headers: {
        'x-rapidapi-host': 'wft-geo-db.p.rapidapi.com',
        'x-rapidapi-key': '228b639b3bmsha3d5a2853287f8fp12033djsn1ec5e589b9bc'
      });
  if (response.statusCode == 200) {
    print(response.body);
    countryName = jsonDecode(response.body)["data"]["name"];
    // print("ISO Code: $query");
    // print("COuntryName: $countryName");

    // countryCapital = jsonDecode(response.body)["data"]["capital"];
    // print("Capital: $countryCapital");

    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('error cought');
  }
}

class Album {
  final String cName;
  final String cCap;

  const Album({
    required this.cName,
    required this.cCap,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      cName: json['data']['name'],
      cCap: json['data']['capital'],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'api_networking.dart';
// import 'main.dart';

// void func() async {
//   await getData;
//   // print(network.countryName);
//   // print(network.countryCapital);
//   // print(network.countryName);

// }

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
  late Future<Album> fetch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch = getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder<Album>(
            future: fetch,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: [
                  Container(child: Text('ISO Code: $inputISOquery')),
                  Container(
                      child: Text(
                          "Country Name: " + snapshot.data!.cName.toString())),
                  Container(
                      child: Text(
                          "Country Capital: " + snapshot.data!.cCap.toString()))
                ]);
              } else if (!snapshot.hasData) {
                return Text('error');
              } else {
                return Text("error no data");
              }

              // else if(snapshot.data == "waiting"){
              //   return Center(
              //     child: CircularProgressIndicator(),
              //   )
              // }
            },
            // child: Column(
            //       children: [
            // Container(child: Text('ISO Code $inputISOquery')),
            // Container(child: Text(network.countryName)),
            // Container(child: Text(network.countryCapital))
            //       ],
            //     ),
          ),
        ),
      ),
    );
  }
}
