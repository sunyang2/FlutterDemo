import 'package:flutter/material.dart';

/* 表单Form
实际业务中，在正式向服务器提交数据前，都会对各个输入框数据进行合法性校验
Flutter提供了一个Form 组件，它可以对输入框进行分组，然后进行一些统一操作，如输入内容校验、输入框重置以及输入内容保存


Form
Form继承自StatefulWidget对象，它对应的状态类为FormState。Form类的定义：

Form({
  @required Widget child,
  bool autovalidate = false,
  WillPopCallback onWillPop,
  VoidCallback onChanged,
})
autovalidate：是否自动校验输入内容；当为true时，每一个子FormField内容发生变化时都会自动校验合法性，并直接显示错误信息。
否则，需要通过调用FormState.validate()来手动校验。
onWillPop：决定Form所在的路由是否可以直接返回（如点击返回按钮），该回调返回一个Future对象，
如果Future的最终结果是false，则当前路由不会返回；
如果为true，则会返回到上一个路由。此属性通常用于拦截返回按钮。
onChanged：Form的任意一个子FormField内容发生变化时会触发此回调。

FormField
Form的子孙元素必须是FormField类型，FormField是一个抽象类，定义几个属性，FormState内部通过它们来完成操作，FormField部分定义如下：

const FormField({
  ...
  FormFieldSetter<T> onSaved, //保存回调
  FormFieldValidator<T>  validator, //验证回调
  T initialValue, //初始值
  bool autovalidate = false, //是否自动校验。
})
Flutter提供了一个TextFormField组件，它继承自FormField类，也是TextField的一个包装类，所以除了FormField定义的属性之外，它还包括TextField的属性


FormState
FormState为Form的State类，可以通过Form.of()或GlobalKey获得。我们可以通过它来对Form的子孙FormField进行统一操作。我们看看其常用的三个方法：

FormState.validate()：调用此方法后，会调用Form子孙FormField的validate回调，如果有一个校验失败，则返回false，所有校验失败项都会返回用户返回的错误提示。
FormState.save()：调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容
FormState.reset()：调用此方法后，会将子孙FormField的内容清空。
*/

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pswController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  _body() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Form(
        key: _formKey, //设置globalKey，用于后面获取FormState
        autovalidateMode: AutovalidateMode.always, //开启自动校验
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  icon: Icon(Icons.person)),
              // 校验用户名
              validator: (v) {
                return v.trim().length > 0 ? null : '用户名不能为空';
              },
            ),
            TextFormField(
              obscureText: true,
              controller: _pswController,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: '密码',
                hintText: '您的登陆密码',
              ),
              // 校验用户名
              validator: (v) {
                return v.trim().length > 5 ? null : '密码不能少于6位';
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 28.0),
              child: Row(
                children: [
                  Expanded(
                      child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            //在这里不能通过此方式获取FormState，context不对
                            //print(Form.of(context));

                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //验证通过提交数据
                              print(_unameController.text);
                              print(_pswController.text);
                            }
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Test')),
      body: _body(),
    );
  }
}
