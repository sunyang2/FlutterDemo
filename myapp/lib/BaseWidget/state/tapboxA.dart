import 'package:flutter/material.dart';

class TapbosxA extends StatefulWidget {
  @override
  _TapbosxAState createState() => _TapbosxAState();
}

class _TapbosxAState extends State<TapbosxA> {
  bool _active = false;

  _handleTop() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTop,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'active' : 'InAction',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
