// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'http://www.json-generator.com/api/json/get/cquKdvYfsi?indent=2';

  List data;
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});


    setState(() {
    var datajson = json.decode(response.body);
    print(datajson.toString());
    data = datajson["eleves"];


    });
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text('Epsi B2G1'),
    ),
    body: new ListView.builder(
    itemCount: data.length,
    itemBuilder: (BuildContext context, i) {
    return new ListTile(
      title: new Text(data[i]["prenom"] + " " + data[i]["nom"]),
      trailing: Icon(data[i]["abs"] ? Icons.check : Icons.cancel,
      color: data[i]["abs"] ? Colors.green  : Colors.red),
    );
    }));
  }
}

