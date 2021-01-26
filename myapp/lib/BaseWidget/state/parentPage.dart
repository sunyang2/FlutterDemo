import 'package:flutter/material.dart';
import 'tapboxB.dart';
import 'tapboxC.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _action = false;

  _hanldeTop(bool newV) {
    setState(() {
      _action = !_action;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapboxC(
      active: _action,
      onChanged: _hanldeTop,
    );
  }
}
