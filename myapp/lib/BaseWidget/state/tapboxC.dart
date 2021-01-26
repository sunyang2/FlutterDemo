import 'package:flutter/material.dart';

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChange;

  const TapboxC({Key key, this.active, this.onChange, onChanged}) : super(key: key);

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  _handleTap() {}

  _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }
  _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'active' : 'InActive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all(
            color: Colors.teal[700],
            width: 10.0
          ) : null
        ),
      ),
    );
  }
}
