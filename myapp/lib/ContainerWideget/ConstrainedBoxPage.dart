import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。

UnconstrainedBox
UnconstrainedBox不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制。
一般情况下，我们会很少直接使用此组件，但在"去除"多重限制的时候也许会有帮助
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
        color: Colors.yellow,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
        ),
      ),
    );
  }

  _sizedBoxBody() {
    return SizedBox(
      height: 80,
      width: 80,
      child: Container(
        color: Colors.yellowAccent,
      ),
    );
  }

  _constrainedBox3() {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 60.0, minWidth: 60.0),
      child: ConstrainedBox(
        //“去除”父级限制
        constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
        ),
      ),
    );
  }

  _constrainedBox4() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),
      child: UnconstrainedBox(
          child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 20, minWidth: 40),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox'),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
      ),
      body: _constrainedBox4(),
    );
  }
}
