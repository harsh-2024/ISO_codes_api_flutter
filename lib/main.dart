import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'api_networking.dart';

String inputISOquery = " ";

void main() {
  runApp(API());
}

class API extends StatelessWidget {
  const API({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Expanded(
                // margin: EdgeInsets.only(top: 300, left: 10, right: 10),
                child: TextFormField(
                  cursorColor: Colors.white12,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                  focusNode: FocusNode(canRequestFocus: true),
                  onChanged: (value) => {inputISOquery = value.toUpperCase()},
                  decoration: InputDecoration(
                      prefixIcon:
                          Image.asset('images/search-solid.png', scale: 20),
                      suffixIcon: Image.asset(
                        'images/location-pin-solid.png',
                        scale: 20,
                      ),
                      focusColor: Colors.black38,
                      hintText: 'Enter the ISO code',
                      labelText: 'ISO',
                      labelStyle: TextStyle(color: Colors.black38),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(45.0),
                          borderSide: BorderSide(color: Colors.black26)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Result())),
              child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Text("SEARCH"),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}
