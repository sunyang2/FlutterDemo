import 'package:flutter/material.dart';

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxB({Key key, this.active, @required this.onChanged}) : super(key: key);
  
  _handleTap() {
    onChanged(active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Center(
        child: Text(
          active ? 'action' : 'Inacion',
          style: TextStyle(fontSize: 32.0, color: Colors.red),
        ),
      ),
    );
  }
}
