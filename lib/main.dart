import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'api_networking.dart';
import 'displayData.dart';

Network network = Network();
String inputISOquery = " ";

void main() {
  runApp(API());
}

// ListTile display() {
//   network.getData();
//   model.country_name = network.countryName;
//   model.country_cap = network.countryCapital;
//   // print(model.country_name);
//   // print(model.country_cap);
//   return ListTile(
//       title: Text(model.country_name), subtitle: Text(model.country_cap));
// }

class API extends StatelessWidget {
  const API({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TextFormField(
              onChanged: (value) => {inputISOquery = value},
              decoration: InputDecoration(hintText: 'Enter the ISO code'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => {
                    network.getData(),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Result()))
                  },
              child: Text('GO'))
        ],
      ),
    );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   widget;
  // }
}
