
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:group_chat_nhz/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          kLightPrimary1,
          kDarkPrimary2
        ],
        begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: SpinKitSpinningLines(
size: 100,
color: Colors.white,
      ),
    );
  }
}
