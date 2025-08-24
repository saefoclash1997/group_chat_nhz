import 'package:flutter/material.dart';
import 'package:group_chat_nhz/constants.dart';
import 'package:group_chat_nhz/forget_password_screen.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'background_decoration.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                        child: Image.asset(
                          "assets/images/app_icon.png",
                          width: 80,
                        ),
                      ),
                      SizedBox(width: 16),
                      NeonText(
                        text: "Sign In",
                        spreadColor: Colors.blue.shade600,
                        blurRadius: 20,
                        textSize: 74,
                        textColor: Colors.grey.shade200,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  CustomTextFormField(title: "Email"),
                  SizedBox(height: 16.0),
                  CustomTextFormField(title: "Password"),
                  SizedBox(height: 16.0),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(fontSize: 18.0),
                      children: [
                        TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: "Forget your Password?",
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: TextButton(
                            onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen())) ;           
                            },
                            child: Text(
                              "Click Here",
                              style: TextStyle(color: kDarkPrimary1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Hero(
                    tag: "SIgnIn",
                    child: CustomButton(
                      width: 160.0,
                      title: "Sign In",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
