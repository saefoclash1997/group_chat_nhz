import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_nhz/screens/sign_in.dart';
import 'package:group_chat_nhz/screens/sign_up.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundDecoration(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                    
                    
                    tag: "appImage",
                    child: Image.asset("assets/images/app_icon.png", width: 200)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 28.0,
                      color: Colors.green
                    ),
                    child: AnimatedTextKit(
                      repeatForever: false,

                      animatedTexts: [
                        TyperAnimatedText('Welcome to Chat App',
                        speed: Duration(milliseconds: 200),
                          curve: Curves.easeInOut

                        ),

                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  )
                ),

                Hero(
                  tag: "SIgnIn",
                  child: CustomButton(
                    title: "Sign In",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.0),

                Hero(
                  tag: "SIgnUp",
                  child: CustomButton(
                    title: "Sign Up",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
