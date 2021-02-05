import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  Color _color;

  TextSection(this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this._color,
      ),
      child: Text(''),
    );
  }
}
