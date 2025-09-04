import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_nhz/screens/chat_screen.dart';
import 'package:neon_widgets/neon_widgets.dart';
import '../auth_services.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final AuthenticationServices _authenticationServices =  AuthenticationServices();

  final _formKey = GlobalKey<FormState>();

  signUp(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      String? errorMessage = await  _authenticationServices.signUp(
      emailController.text.trim().toString(),
          passwordController.text.trim().toString());
      if(errorMessage == null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
            (context)=>ChatScreen()), (route) => false,);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            errorMessage
          ))
        );
      }


    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
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
                    CustomTextFormField(title: "Email",
                      controller: emailController,
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return "Please Enter The Email";
                        }
                      },

                    ),
                    SizedBox(height: 16.0,),
                    CustomTextFormField(title: "Password",
                      controller: passwordController,
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return "Please Enter The Password";
                        }else if(value.length < 6){
                          return "Short Password";
                        }
                      },
                    ),
                    SizedBox(height: 16.0,),
                    CustomTextFormField(title: "Confirm Password",
                      controller: confirmPasswordController,
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return "Please Enter The Password";
                        }else if(passwordController.text != confirmPasswordController.text){
                          return "Did Not Match The Password";
                        }
                      },


                    ),
                    SizedBox(height: 16.0,),
                    Hero(
                      tag: "SIgnUp",
                      child: CustomButton(
                        width: 160.0,
                        title: "Sign Up",
                        onPressed: () async {
                          signUp(context);

                        },
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}