import 'package:flutter/material.dart';
import 'dart:math' as math;

/*
变换（Transform）
Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效

平移
Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子组件平移指定的距离

旋转
Transform.rotate可以对子组件进行旋转变换，

缩放
Transform.scale可以对子组件进行缩小或放大

RotatedBox
RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
*/
class TransformPage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
  ///Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作
  _body() {
    return Container(
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.skewY(0.3),
        child: Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.deepOrange,
          child: Text('Apartment for rent!'),
        ),
      ),
    );
  }

  /// 平移
  _body2() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //默认原点为左上角，左移20像素，向上平移5像素
      child: Transform.translate(
        offset: Offset(-20.0, -5.0),
        child: Text("Hello world"),
      ),
    );
  }

  /// 旋转
  _body3() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //默认原点为左上角，左移20像素，向上平移5像素
      child: Transform.rotate(
        //旋转90度
        angle: math.pi / 2,
        child: Text("Hello world"),
      ),
    );
  }

  /// 缩放
  _body4() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //默认原点为左上角，左移20像素，向上平移5像素
      child: Transform.scale(
        scale: 1.5, //放大到1.5倍
        child: Text("Hello world"),
      ),
    );
  }

  /// 缩放
  _body5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //将Transform.rotate换成RotatedBox
          child: RotatedBox(
            quarterTurns: 1, //旋转90度(1/4圈)
            child: Text("Hello world"),
          ),
        ),
        Text(
          "你好",
          style: TextStyle(color: Colors.green, fontSize: 18.0),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransformPage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(80),
        child: _body5(),
      ),
    );
  }
}
