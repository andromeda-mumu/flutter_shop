import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/page/HomePage.dart';
import 'package:flutter_shop/page/MsgPage.dart';
import 'package:flutter_shop/page/MyPage.dart';
import 'package:flutter_shop/page/ShopPage.dart';
import 'package:flutter_shop/widget/Demo1.dart';


/**
 * Created by wangjiao on 2019/6/11.
 * description:
 */

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
       debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
         "/demo1":(BuildContext context)=>new Demo1(),
      },
      home:new MainPageWidget()
    );
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  _MainPageWidgetState createState() => new _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  int _tabIndex =0;
  var tabImages;
  var appBarTitles=['首页','商铺','消息','我的'];
  /*
   * 根据image路径获取图片
   * 这个图片的路径需要在 pubspec.yaml 中去定义
   */
  Image getTabImage(path){
    return new Image.asset(path,width: 20.0,height: 20.0,);
  }

  /**
   * 据索引获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex){
    if(curIndex==_tabIndex){
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }
  /**
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex){
    if(curIndex==_tabIndex){
      return new Text(appBarTitles[curIndex],style: new TextStyle(color: const Color(0xff63ca6c)));
    }else{
      return new Text(appBarTitles[curIndex],style: new TextStyle(color: const Color(0xff888888)),);
    }
  }
  //存储四个页面
  var _bodys;
  void initData(){
    tabImages=[
      [
        getTabImage('images/ic_home_normal.png'),
        getTabImage('images/ic_home_press.png')
    ],
    [
        getTabImage('images/ic_shop_normal.png'),
        getTabImage('images/ic_shop_press.png')
    ],
    [
        getTabImage('images/ic_msg_normal.png'),
        getTabImage('images/ic_msg_press.png')
    ],
    [
        getTabImage('images/ic_my_normal.png'),
        getTabImage('images/ic_my_press.png')
    ]
    ];

  _bodys =[
      new HomePage(),
      new ShopPage(),
      new MsgPage(),
      new MyPage(context)
  ];
  }


  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('主页'),
      ),
      body: _bodys[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
           new BottomNavigationBarItem(icon: getTabIcon(0),title: getTabTitle(0)),
            new BottomNavigationBarItem(icon: getTabIcon(1),title:getTabTitle(1)),
            new BottomNavigationBarItem(icon: getTabIcon(2),title: getTabTitle(2)),
            new BottomNavigationBarItem(icon: getTabIcon(3),title:getTabTitle(3)),
          ],
      //设置显示模式
      type: BottomNavigationBarType.fixed,
      //设置当前索引
      currentIndex: _tabIndex,
      //tabBottom的点击监听
      onTap: (index){
          setState(() {
            _tabIndex =index;
          });
      },
    ),
    );
  }
}

