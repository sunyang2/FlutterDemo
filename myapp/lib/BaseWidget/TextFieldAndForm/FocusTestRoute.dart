import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/* 控制焦点
焦点可以通过FocusNode和FocusScopeNode来控制，
默认情况下，焦点由FocusScope来管理，它代表焦点控制范围，可以在这个范围内可以通过FocusScopeNode在输入框之间移动焦点、设置默认焦点等。
我们可以通过FocusScope.of(context) 来获取Widget树中默认的FocusScopeNode。

下面看一个示例，在此示例中创建两个TextField，第一个自动获取焦点，然后创建两个按钮：
点击第一个按钮可以将焦点从第一个TextField挪到第二个TextField。
点击第二个按钮可以关闭键盘。

监听焦点状态改变事件
FocusNode继承自ChangeNotifier，通过FocusNode可以监听焦点的改变事件，如：

...
// 创建 focusNode   
FocusNode focusNode = new FocusNode();
...
// focusNode绑定输入框   
TextField(focusNode: focusNode);
...
// 监听焦点变化    
focusNode.addListener((){
   print(focusNode.hasFocus);
});
获得焦点时focusNode.hasFocus值为true，失去焦点时为false。

自定义样式
虽然我们可以通过decoration属性来定义输入框样式
*/

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  _body() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: 'input2',
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(labelText: 'input1'),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: '请输入用户名',
              prefixIcon: Icon(Icons.person),
              // 未获得焦点下划线设为灰色
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
            ),
          ),
          Builder(builder: (cxt) {
            return Column(
              children: [
                RaisedButton(
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    if (null == focusScopeNode) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                  child: Text('移动焦点'),
                ),
                RaisedButton(
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                  child: Text('隐藏焦点'),
                )
              ],
            );
          }),
        ],
      ),
    );
  }

  _body2() {
    return Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200], //定义下划线颜色
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                )),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "密码",
                  hintText: "您的登录密码",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)),
              obscureText: true,
            ),
            Container(
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "电子邮件地址",
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none //隐藏下划线
                      )),
              decoration: BoxDecoration(
                  // 下滑线浅灰色，宽度1像素
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _body2();
  }
}
