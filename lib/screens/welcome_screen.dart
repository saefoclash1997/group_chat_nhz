import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_nhz/constants.dart';
import 'package:group_chat_nhz/screens/sign_in.dart';
import 'package:group_chat_nhz/screens/sign_up.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  Animation? colorAnimation;
  Animation<Offset>? offsetImage;
  Animation<double>? opacityImage;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );

    offsetImage = Tween<Offset>(
      begin: Offset(-1, -2),
      end: Offset(0.0, 0.0),
    ).animate(_animationController!);

    opacityImage = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController!);

    _animationController!.forward();
    _animationController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Access Theme.of(context) here for initialization.
    colorAnimation = ColorTween(
      begin: kDarkPrimary2,
      end: Theme.of(context).scaffoldBackgroundColor,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation!.value,
      body: Stack(
        children: [
          BackGroundDecoration(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: opacityImage!,
                  child: SlideTransition(
                    position: offsetImage!,
                    child: Hero(
                      tag: "appImage",
                      child: Image.asset(
                        "assets/images/app_icon.png",
                        width: 200,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 28.0, color: Colors.green),
                    child: AnimatedTextKit(
                      repeatForever: false,

                      animatedTexts: [
                        TyperAnimatedText(
                          'Welcome to Chat App',
                          speed: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        ),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
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
