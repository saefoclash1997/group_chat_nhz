import 'package:flutter/material.dart';

class PageviewWelcome extends StatelessWidget {
  const PageviewWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Center(child: Text("Welcome to NHZ Chat App!",style: TextStyle(color: Colors.red),),),
          Center(child: Text("In this App you can Chat With Your Friends",style: TextStyle(color: Colors.green),),),
          Center(child: Text("Let's Get Started",style: TextStyle(color: Colors.blue),),),



        ],
      ),
    );
  }
}
