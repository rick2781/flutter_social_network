import 'package:flutter/material.dart';
import 'package:flutter_social_network/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "SocialNetwork",
      home: new Home(),
    );
  }
}