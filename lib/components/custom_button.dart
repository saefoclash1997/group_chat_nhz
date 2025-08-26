import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final void Function()? onPressed;
  const CustomButton({
    super.key, required this.title, this.width = 250, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        gradient: title == "Sign In" ? kLightGradiant : kDarkGradiant,
      ),
      child:  MaterialButton(onPressed: onPressed,
        height: 64,
        minWidth: 250.0,
        elevation: 0.0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),),
        child:Text(title,style: TextStyle(
          fontSize: 28.0,
          color: Colors.white
        ),),

      ),
    );
  }
}
