import 'package:flutter/material.dart';
import 'package:group_chat_nhz/constants.dart';
import 'package:neon_widgets/neon_widgets.dart';
import '../components/background_decoration.dart';
import '../components/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  TextEditingController? emailController ;
  ForgetPasswordScreen({super.key,this .emailController});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {


  bool isClicked  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundDecoration(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: 'appIcon',
                      child: Image.asset(
                        'assets/images/app_icon.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                    ),
                    NeonText(
                      text: 'Forget Password',
                      spreadColor: Colors.blue.shade600,
                      blurRadius: 20,
                      textSize: 30,
                      textColor: Colors.grey.shade200,
                    ),

                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                CustomTextFormField(
                  controller: widget. emailController,
                  title: "Email",
                ),
                SizedBox(
                  height: 18.0,
                ),
                GestureDetector(
                  onTap: isClicked ?  null  : (){
                    widget.emailController?.clear();
                    setState(() {
                      isClicked =!isClicked;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(
                      milliseconds: 600,
                    ),
                    padding: EdgeInsets.all(18.0),
                    width: isClicked ? 180.0 : 130.0,
                    decoration: BoxDecoration(
                        gradient: isClicked ? LinearGradient(colors: [
                          Colors.green,
                          Colors.green.shade400
                        ])  : kDarkGradiant,
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(5, 5),
                              blurRadius: 4.0
                          )
                        ]
                    ),
                    alignment: Alignment.center,
                    child: isClicked ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(   'Sent !',style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                        ),),
                        Icon(Icons.check,
                          color: Colors.white,
                          size: 26.0,
                        )
                      ],
                    )




                        :  Text(   'Send',style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                    ),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ElevatedButton(onPressed: (){}, child: Text("Log In",style: TextStyle(
// color: Colors.white,
// fontSize: 26.0,
// ),),
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.red),
// ),
// ),

// GestureDetector(
// onTap: (){
// print("HHHHHHHHHHH");
// },
// child: Container(
// width: 250.0,
// height: 65.0,
// alignment: Alignment.center,
// child: Text("Log In",style: TextStyle(
// color: Colors.white,
// fontSize: 26.0,
// ),),
// decoration: BoxDecoration(
// gradient: kLightGradiant,
// borderRadius: BorderRadius.circular(100.0),
// boxShadow: [
// BoxShadow(
// color: Colors.black54,
// offset: Offset(5, 5),
// blurRadius: 4.0
// )
// ]
// ),
// ),
// ),
// SizedBox(height: 18.0,),
