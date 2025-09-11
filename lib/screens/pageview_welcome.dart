import 'package:flutter/material.dart';
import 'package:group_chat_nhz/components/background_decoration.dart';
import 'package:group_chat_nhz/components/custom_button.dart';
import 'package:group_chat_nhz/screens/welcome_screen.dart';

class PageviewWelcome extends StatelessWidget {
  PageviewWelcome({super.key});

  List <String> welcomeText = [
    "Welcome to NHZ Chat App!","In this App you can Chat With Your Friends","Let's Get Started",
  ];

  List <String> welcomeImages = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundDecoration(),
        Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: PageView.builder(
            itemCount: welcomeText.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Spacer(),
                  Image.asset(welcomeImages[index]),
                  SizedBox(height: 24,),
                  Text(
                      welcomeText[index],       textAlign: TextAlign.center,
                    style: TextStyle(
                     fontSize: 24,
                    ),

                  ),
                  Spacer(),
                index == 2 ?  CustomButton(title: "Lets Go!",
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
                },

                ) : Container()
                ],
              );
            },

          ),
        ),
      ],
    );
  }
}
