import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_nhz/components/loading_screen.dart';
import 'package:group_chat_nhz/constants.dart';
import 'package:group_chat_nhz/screens/forget_password_screen.dart';
import 'package:neon_widgets/neon_widgets.dart';
import '../auth_services.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';
import '../components/fade_animation.dart';
import 'chat_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final AuthenticationServices _authenticationServices =  AuthenticationServices();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState> ();

  signIn(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if(_formKey.currentState!.validate()){
      String? errorMessage = await  _authenticationServices.signIn(
          emailController.text.trim().toString(),
          passwordController.text.trim().toString());
      if(errorMessage == null){
        setState(() {
          isLoading = false;
        });
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
            (context)=>ChatScreen()), (route) => false,);
      }else{
        setState(() {
          isLoading = false;
        });
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

    return isLoading? LoadingScreen() : Scaffold(
      body: Stack(
        children: [
          BackGroundDecoration(),
          Form(
           key: _formKey,
            child: Center(
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
                        FadeAnimation(
                          delay: 250,
                          child: NeonText(
                            text: "Sign In",
                            spreadColor: Colors.blue.shade600,
                            blurRadius: 20,
                            textSize: 74,
                            textColor: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    FadeAnimation(
                      delay: 500,
                      child: CustomTextFormField(
                        title: "Email",
                        controller: emailController,
                        validator: (value){
                          if(value == null  || value.isEmpty){
                            return "Please Enter The Email";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    FadeAnimation(
                      delay: 750,
                      child: CustomTextFormField(
                        title: "Password",
                        controller: passwordController,
                        validator: (value){
                          if(value == null  || value.isEmpty){
                            return "Please Enter The Password";
                          }else if(value.length < 6){
                            return "Short Password";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    FadeAnimation(
                      delay: 1000,
                      child: RichText(
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgetPasswordScreen(
                                        emailController: emailController,
                                      ),
                                    ),
                                  );
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
                    ),
                    SizedBox(height: 16.0),
                    Hero(
                      tag: "SIgnIn",
                      child: CustomButton(
                        width: 160.0,
                        title: "Sign In",
                        onPressed: ()  {
                          signIn(context);

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
