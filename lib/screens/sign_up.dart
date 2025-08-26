import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundDecoration(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Hero(
                          tag: "appImage",
                          child: Image.asset("assets/images/app_icon.png", width: 80)),
                      SizedBox(width: 16,),
                      NeonText(
                        text: "Sign Up",
                        spreadColor: Colors.blue.shade600,
                        blurRadius: 20,
                        textSize: 74,
                        textColor: Colors.grey.shade200,
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0,),
                  CustomTextFormField(title: "Email",),
                  SizedBox(height: 16.0,),
                  CustomTextFormField(title: "Password",),
                  SizedBox(height: 16.0,),
                  CustomTextFormField(title: "Confirm Password",),
                  SizedBox(height: 16.0,),
                  Hero(
                    tag: "SIgnUp",
                    child: CustomButton(
                      width: 160.0,
                      title: "Sign Up",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}