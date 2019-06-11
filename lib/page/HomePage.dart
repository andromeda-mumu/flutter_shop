import 'package:flutter/material.dart';
import 'package:flutter_shop/widget/Demo1.dart';
/**
 * Created by wangjiao on 2019/6/11.
 * description:
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Center(child: new RaisedButton(onPressed: _pushPage,child: new Text('跳转'),),),
      ),
    );
  }
  _pushPage(){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return new Demo1();
    }));
  }
}

