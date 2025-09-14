import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_nhz/components/loading_screen.dart';
import 'package:group_chat_nhz/provider/theme_provider.dart';
import 'package:group_chat_nhz/screens/chat_screen.dart';
import 'package:group_chat_nhz/screens/pageview_welcome.dart';
import 'package:group_chat_nhz/screens/sign_up.dart';
import 'package:group_chat_nhz/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isOpened =false;

 Future<void> checkIfOpened () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isOpened = prefs.getBool("isOpened") ?? false ;
    });
    if(isOpened != true){
      prefs.setBool("isOpened", true);
    }
  }

  @override
  void initState() {
    checkIfOpened ();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(

      routes: {
        ChatScreen.id : (_) => ChatScreen(),
        SignUpScreen.id :(_) => SignUpScreen(),

      },
      theme: themeProvider.isDarkMode() ? ThemeData.dark() : ThemeData.light(),
      // TODO: زبط الوضع تبع الدراور

      debugShowCheckedModeBanner: false,
      home: isOpened ? AuthenticationWrapper()
      : PageviewWelcome()

      ,
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        } else {
          final User? user = snapshot.data;
          if (user == null) {
            return WelcomeScreen();
          } else {
            return ChatScreen();
          }
        }
      },
    );
  }
}
