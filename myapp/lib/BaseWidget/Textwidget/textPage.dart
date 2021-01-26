import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'hello world',
          textAlign: TextAlign.left, //文本的对齐方式
        ),
        Text(
          'hello world! Im jack. ' * 4,
          maxLines: 2, //文本显示的最大行数
          overflow: TextOverflow.ellipsis, //截断方式，默认是直接截断
        ),
        Text(
          'hello world',
          textScaleFactor: 1.5, //对于当前字体大小的缩放因子
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            height: 1.2,
            fontFamily: 'Courier',
            background: Paint()..color = Colors.yellow,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed,
          ),
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: 'home:', style: TextStyle(color: Colors.red)),
          TextSpan(
            text: 'https://flutterchina.club',
            style: TextStyle(color: Colors.blue),
          )
        ])),

        DefaultTextStyle(
          //设置文本默认样式  
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.start,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('hello workd'),
              Text('I am Jack'),
              Text(
                'I am Jack',
                style: TextStyle(color: Colors.grey, inherit: false),//2.不继承默认样式
              ),
            ],
          ),

        )
      ],
    );
  }
}
