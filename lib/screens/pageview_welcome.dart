import 'package:flutter/material.dart';

class PageviewWelcome extends StatelessWidget {
  const PageviewWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Center(child: Text("welcome",style: TextStyle(color: Colors.red),),),
          Center(child: Text("welcome",style: TextStyle(color: Colors.green),),),
          Center(child: Text("welcome",style: TextStyle(color: Colors.blue),),),



        ],
      ),
    );
  }
}
