import 'package:flutter/material.dart';

import 'MainPage.dart';
void main(){
    runApp(
      new MyApp()
    );

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter shop',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
