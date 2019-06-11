import 'package:flutter/material.dart';
/**
 * Created by wangjiao on 2019/6/11.
 * description:
 */
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter shop',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Center(child: new Text('首页'),),
      ),
    );
  }
}
