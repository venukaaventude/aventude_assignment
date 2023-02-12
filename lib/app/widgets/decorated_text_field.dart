import 'package:aventude_assignment/app/shared/keyboard_handler.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget with DismissKeyboard {
  final TextEditingController controller;
  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final Function? onChanged;
  final VoidCallback? onSuffixIconTap;
  final TextInputType keyboardType;

  TextFieldWidget(
      {Key? key,
      required this.controller,
      this.hintText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText = false,
      this.onChanged,
      this.onSuffixIconTap,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      obscureText: obscureText,
      cursorColor: Theme.of(context).buttonTheme.colorScheme!.secondary,
      style: TextStyle(
        color: Theme.of(context).buttonTheme.colorScheme!.secondary,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(
            color: Theme.of(context).buttonTheme.colorScheme!.secondary),
        focusColor: Theme.of(context).buttonTheme.colorScheme!.secondary,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Theme.of(context).buttonTheme.colorScheme!.secondary),
        ),
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Theme.of(context).buttonTheme.colorScheme!.secondary,
        ),
        suffixIcon: InkWell(
          onTap: () {
            if (onSuffixIconTap != null) {
              onSuffixIconTap!();
            }
            dismissKeyboard(context);
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: Theme.of(context).buttonTheme.colorScheme!.secondary,
          ),
        ),
      ),
    );
  }
}
