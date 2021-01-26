import 'package:flutter/material.dart';

/*
Material组件库中的按钮
Material 组件库中提供了多种按钮组件如RaisedButton、FlatButton、OutlineButton等，
它们都是直接或间接对RawMaterialButton组件的包装定制，
所以他们大多数属性都和RawMaterialButton一样
*/
class BtnPage extends StatefulWidget {
  @override
  _BtnPageState createState() => _BtnPageState();
}

class _BtnPageState extends State<BtnPage> {
  @override
  _onPressed() {}

  Widget build(BuildContext context) {
    return Column(
      children: [
        // RaisedButton "漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
        RaisedButton(
          onPressed: () {},
          child: Text('normal'),
          color: Colors.red,
        ),

        // FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
        FlatButton(
          onPressed: () {},
          child: Text('normal'),
          color: Colors.blue,
        ),

        // OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
        OutlineButton(
          onPressed: () {},
          child: Text('normal'),
          color: Colors.green,
        ),

        // IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
        IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),

        /*
        带图标的按钮
        RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮
        */
        RaisedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: _onPressed,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text("添加"),
          onPressed: _onPressed,
        ),
        FlatButton.icon(
          icon: Icon(Icons.info),
          label: Text("详情"),
          onPressed: _onPressed,
        ),

        /*
        自定义按钮外观
        按钮外观可以通过其属性来定义，不同按钮属性大同小异
        */
        FlatButton(
          onPressed: _onPressed, 
          child: Text('sumbit'),
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          splashColor: Colors.grey,
          colorBrightness: Brightness.dark,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),

      ],
    );
  }
}
