import 'package:flutter/material.dart';
import 'package:flutter_shop/widget/Demo1.dart';
class MyPage extends StatelessWidget {
  var parentContext;
  MyPage(this.parentContext);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
//      home: new Scaffold(
//        body: new Center(child:new Text("我的")),
//      ),
       home:  new PageWidget(parentContext),
        routes: <String,WidgetBuilder>{
          "/demo1":(BuildContext context)=>new Demo1(),
        }
    );
  }
}
class PageWidget extends StatefulWidget {
  var parentContext;
  PageWidget(this.parentContext);
  @override
  _PageWidgetState createState() => new _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(child: new RaisedButton(onPressed: _pushPage,child: new Text('跳转'),),),
    );
  }
  _pushPage(){
    //这个不行，因为routes定义在mypage里，而parentContext是MainPage的
    Navigator.of(widget.parentContext).pushNamed('/demo1');
//    Navigator.of(widget.parentContext).push(new MaterialPageRoute(builder: (context){
//      return new Demo1();
//    },));
  }
}
