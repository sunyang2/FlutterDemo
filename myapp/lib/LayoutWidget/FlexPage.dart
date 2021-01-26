import 'package:flutter/material.dart';

/* 弹性布局（Flex）
弹性布局允许子组件按照一定比例来分配父容器空间
Flutter中的弹性布局主要通过Flex和Expanded来配合实现

Flex
Flex组件可以沿着水平或垂直方向排列子组件
Flex({
  ...
  @required this.direction, //弹性布局的方向, Row默认为水平方向，Column默认为垂直方向
  List<Widget> children = const <Widget>[],
})

Expanded
可以按比例“扩伸” Row、Column和Flex子组件所占用的空间。
const Expanded({
  int flex = 1, 
  @required Widget child,
})
flex参数为弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间。如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间
*/

class FlexPage extends StatefulWidget {
  @override
  _FlexPageState createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {

  _body() {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                height: 30.0,
                color: Colors.green,
              ),
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.only(top: 30),
          child: SizedBox(
            height: 100.0,
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                    height: 30,
                  )
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red
                  ),
                ),
              ],  
            ),
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return _body();
  }
}