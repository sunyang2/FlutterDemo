import 'package:flutter/material.dart';

/* 单选开关和复选框
Material 组件库中提供了Material风格的单选开关Switch和复选框Checkbox，
虽然它们都是继承自StatefulWidget，但它们本身不会保存当前选中状态，选中状态都是由父组件来管理的。
当Switch或Checkbox被点击时，会触发它们的onChanged回调，我们可以在此回调中处理选中状态改变逻辑
*/

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = false;
  bool _checkBoxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
            value: _switchSelected,
            onChanged: (v) {
              setState(() {
                _switchSelected = v;
              });
            }),
        Checkbox(
            value: _checkBoxSelected,
            activeColor: Colors.red, //选中时的颜色
            onChanged: (v) {
              setState(() {
                _checkBoxSelected = v;
              });
            })
      ],
    );
  }
}
