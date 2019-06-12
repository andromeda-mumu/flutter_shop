import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class ShopPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new ShopState();
  }
}

class ShopState extends State<ShopPage>{
  List data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pullNet();

  }

  void _pullNet()async{
    await http.get("http://www.wanandroid.com/project/list/1/json?cid=1")
        .then((http.Response response){
      var converDataToJson = json.decode(response.body);
      converDataToJson = converDataToJson['data']['datas'];

      print(converDataToJson);

      setState(() {
        data = converDataToJson;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
     body: new ListView(
//       children: <Widget>[
//         _getItem2(),
//         _getItem2()
//       ],
     children: data!=null?_getItem():_loading(),
     ),
    );
  }
  List<Widget> _loading(){
    return <Widget>[
      new Container(
        height: 300,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(strokeWidth: 1.0,),
              new Text('正在加载')
            ],
          ),
        ),
      )
    ];
  }

  List<Widget> _getItem(){
    return data.map((item){
      return new Card(
          child: new Padding(
              padding: const EdgeInsets.all(10.0),
              child: _getRowWidget(item),
            ),
          elevation: 3.0,
          margin: const EdgeInsets.all(10),
      );
    }).toList();
  }

  Widget _getRowWidget(item){
    return new Row(children: <Widget>[
      new Flexible(
          flex:1,
          fit:FlexFit.tight,//和android 的weight效果一样
          child: new Stack(children: <Widget>[
            new Column(children: <Widget>[
              new Text('${item['title']}'.trim(),
                style: new TextStyle(color: Colors.black,fontSize: 20.0,),
                textAlign: TextAlign.left,
              ),
              new Text('${item['desc']}',maxLines: 3,)
            ],)
          ],)
      ),
      new ClipRect(
          child: new FadeInImage.assetNetwork(
                placeholder: 'images/ic_shop_normal.png',
                image: '${item['envelopePic']}',
                width: 50,
                height: 50,
                fit: BoxFit.fitWidth,
          ),),
    ],);
  }

  Widget _getItem2(){
    return new Card(
        child: new Padding(padding: const EdgeInsets.all(10.0),child: _getRowWidget2(),),
        elevation: 3.0,
      margin:  const EdgeInsets.all(10.0),
    );
  }
  Widget _getRowWidget2(){
    return new Row(children: <Widget>[
      new Flexible(
          flex:1,
          fit:FlexFit.tight,//和android 的weight效果一样
          child: new Stack(children: <Widget>[
            new Column(children: <Widget>[
              new Text('title'.trim(),
                style: new TextStyle(color: Colors.black,fontSize: 20.0,),
                textAlign: TextAlign.left,
              ),
              new Text('desc',maxLines: 3,)
            ],)
      ],)
      ),
      new ClipRect(child: new FadeInImage.assetNetwork(
          placeholder: 'images/ic_shop_normal.png',
          image: 'images/ic_shop_normal.png',
          width: 50,
        height: 50,
        fit: BoxFit.fitWidth,
      ),),
    ],);
  }

}

