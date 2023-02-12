import 'package:flutter/material.dart';

class TextViewClass {
  Widget setText(String text, bool isBold) {
    Text _textField = Text(text,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        maxLines: 2);
    return _textField;
  }
}
