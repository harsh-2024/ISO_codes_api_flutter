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
          children: [
            Container(
              margin: EdgeInsets.only(top: 300, left: 10, right: 10),
              child: TextFormField(
                focusNode: FocusNode(canRequestFocus: true),
                onChanged: (value) => {inputISOquery = value.toUpperCase()},
                decoration: InputDecoration(
                    focusColor: Colors.black38,
                    enabled: true,
                    fillColor: Colors.white24,
                    hintText: 'Enter the ISO code',
                    labelText: 'ISO',
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // ElevatedButton(
            //     onPressed: () => {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) => Result()))
            //         },
            //     child: Text('SEARCH'))
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

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   widget;
  // }
}
