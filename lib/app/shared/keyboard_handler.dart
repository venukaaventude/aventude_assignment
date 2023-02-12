import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin DismissKeyboard {
  void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
