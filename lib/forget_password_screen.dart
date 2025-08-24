import 'package:flutter/material.dart';
import 'package:group_chat_nhz/constants.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'background_decoration.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
bool isClicked = false;

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
                        text: "Forget Password",
                        spreadColor: Colors.blue.shade900,
                        blurRadius: 20,
                        textSize: 30,
                        textColor: Colors.grey.shade200,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  CustomTextFormField(title: "Email"),
                  SizedBox(height: 16.0),
                  InkWell(
                    onTap: isClicked ? null :      (){
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: AnimatedContainer(duration: Duration(milliseconds: 300),

                      padding: EdgeInsets.symmetric(
                        vertical: 10,horizontal: isClicked ?  60  :  30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        gradient: isClicked ?  kDarkGradiant  : kLightGradiant,
                      ),
                      child:  isClicked ?  SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Text("Sent!" , style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                            ),),

                            Icon(Icons.check , color: Colors.white, size: 28.0,)

                          ],
                        ),
                      )  : Text("Send" , style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                      ),)
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
