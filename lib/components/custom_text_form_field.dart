import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController? controller;
  String? Function(String?)? validator;
  final String title;
  CustomTextFormField({
    this.controller,
    super.key, required this.title,
    this.validator
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      autocorrect: false,
      cursorColor: kDarkPrimary1,
      obscureText: widget.title == "Email" ? false : isObscure,
      decoration: InputDecoration(
        label: Text(widget.title),
        suffixIcon: widget.title == "Email" ? null : IconButton(
          color: kDarkPrimary2,
          onPressed: (){

            setState(() {
              isObscure = !isObscure;
            });
          }, icon:
        Icon( isObscure ? Icons.visibility_off : Icons.visibility,),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
                color: kLightPrimary1,
                width: 2.0
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: kDarkPrimary2,
                width: 3.0
            ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
                color: Colors.red,
                width: 2.0
            )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.red,
              width: 3.0
          ),
        ),
      ),
    );
  }
}
