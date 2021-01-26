import 'package:flutter/material.dart';

/* 尺寸限制类容器
尺寸限制类容器用于限制容器大小，Flutter中提供了多种这样的容器，
如ConstrainedBox、SizedBox、UnconstrainedBox、AspectRatio等。

 ConstrainedBox
ConstrainedBox用于对子组件添加额外的约束。
例如，如果你想让子组件的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子组件的约束

BoxConstraints
BoxConstraints用于设置限制条件，它的定义如下：

const BoxConstraints({
  this.minWidth = 0.0, //最小宽度
  this.maxWidth = double.infinity, //最大宽度
  this.minHeight = 0.0, //最小高度
  this.maxHeight = double.infinity //最大高度
})
BoxConstraints还定义了一些便捷的构造函数，用于快速生成特定限制规则的BoxConstraints,
如BoxConstraints.tight(Size size)，它可以生成给定大小的限制；
const BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的BoxConstraints


SizedBox
SizedBox用于给子元素指定固定的宽高，如：

SizedBox(
  width: 80.0,
  height: 80.0,
  child: redBox
)
*/
class ConstrainedBoxPage extends StatefulWidget {
  @override
  _ConstrainedBoxPageState createState() => _ConstrainedBoxPageState();
}

class _ConstrainedBoxPageState extends State<ConstrainedBoxPage> {
  
  /// ConstrainedBox
  _constrainedBoxAction() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity, //宽度尽可能大
        minHeight: 50.0 //最小高度为50像素
      ),
      
      child: Container(
        height: 5.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
        ),
      ),
    );
  }

  _constrainedBox2() {
    ///BoxConstraints.tightFor(width: 80.0,height: 80.0),
    return SizedBox(
      width: 80.0,
      height: 80.0,
      child: Container(
        height: 5.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _constrainedBox2();
  }
}
