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
//    _pullNet();
     _httpClient();
  }

  /**
   * http的网络请求方式
   */
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

  /**
   * httpclient的网络请求方式
   */
  void _httpClient()async{
    var responseBody;
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse('http://www.wanandroid.com/project/list/1/json?cid=1'));
    var response = await request.close();
    if(response.statusCode==200){
      responseBody = await response.transform(utf8.decoder).join();
      //解析json
      var converDataToJson = jsonDecode(responseBody)['data']['datas'];
      //更新数据
      setState(() {
        data = converDataToJson;
      });
    }else{
      print("error");
    }
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

