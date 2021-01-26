import 'package:flutter/material.dart';

/*
对齐与相对定位（Align）
在上一节中我们讲过通过Stack和Positioned，我们可以指定一个或多个子元素相对于父元素各个边的精确偏移，并且可以重叠。
但如果我们只想简单的调整一个子元素在父元素中的位置的话，使用Align组件会更简单一些。

Align
Align 组件可以调整子组件的位置，并且可以根据子组件的宽高来确定自身的的宽高，定义如下：

Align({
  Key key,
  this.alignment = Alignment.center,
  this.widthFactor,
  this.heightFactor,
  Widget child,
})
alignment : 需要一个AlignmentGeometry类型的值，表示子组件在父组件中的起始位置。
AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset，我们将在下面的示例中详细介绍。

widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；
它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。如果值为null，则组件的宽高将会占用尽可能多的空间。

Alignment
Alignment继承自AlignmentGeometry，表示矩形内的一个点，他有两个属性x、y，分别表示在水平和垂直方向的偏移，Alignment定义如下：

Alignment(this.x, this.y)
Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0) 。
x、y的值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离，因此2个水平（或垂直）单位则等于矩形的宽（或高），如Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而Alignment(1.0, 1.0)代表右侧底部终点，而Alignment(1.0, -1.0) 则正是右侧顶点，即Alignment.topRight。为了使用方便，矩形的原点、四个顶点，以及四条边的终点在Alignment类中都已经定义为了静态常量。

Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标：

(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
其中childWidth为子元素的宽度，childHeight为子元素高度

FractionalOffset
FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致，所以理解起来会比较容易。FractionalOffset的坐标转换公式为：

实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)

Align和Stack对比
Align和Stack/Positioned都可以用于指定子元素相对于父元素的偏移，但它们还是有两个主要区别：

定位参考系统不同；Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点；
而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，最终的偏移是需要通过alignment的转换公式来计算出。
Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠。


Center组件
居中子元素
class Center extends Align {
  const Center({ Key key, double widthFactor, double heightFactor, Widget child })
    : super(key: key, widthFactor: widthFactor, heightFactor: heightFactor, child: child);
}
*/
class AlignPage extends StatefulWidget {
  @override
  _AlignPageState createState() => _AlignPageState();
}

class _AlignPageState extends State<AlignPage> {

  _body() {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue[50],
      child: Align(
        widthFactor: 2,
        heightFactor: 2,
        //alignment: Alignment.topRight,
        alignment: FractionalOffset(0.2, 0.6),
        child: FlutterLogo(
          size: 60.0
        ),
      ),
    );
  }

  _body2() {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Center(child: Text("data"),),
        ),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Center(
            child: Text("data"),
            widthFactor: 1,
            heightFactor: 1,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _body2();
  }
}