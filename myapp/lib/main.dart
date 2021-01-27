import 'package:flutter/material.dart';
import 'BaseWidget/state/tapboxA.dart';
import 'BaseWidget/state/parentPage.dart';
import 'BaseWidget/Textwidget/textPage.dart';
import 'BaseWidget/ButtonWidget/btnPage.dart';
import 'BaseWidget/Img_icon/imgPage.dart';
import 'BaseWidget/Img_icon/ImageAndIconRoutePage.dart';
import 'BaseWidget/SwitchAndCheckbox/SwitchAndCheckBoxTestRoute.dart';
import 'BaseWidget/TextFieldAndForm/TextFieldAndFormPage.dart';
import 'BaseWidget/ProgressIndicator/ProgressIndicator.dart';
import 'LayoutWidget/RowAndColumn.dart';
import 'ContainerWideget/PaddingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: PaddingPage(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
