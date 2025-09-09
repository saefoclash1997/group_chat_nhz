import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_nhz/components/loading_screen.dart';
import 'package:group_chat_nhz/provider/theme_provider.dart';
import 'package:group_chat_nhz/screens/chat_screen.dart';
import 'package:group_chat_nhz/screens/pageview_welcome.dart';
import 'package:group_chat_nhz/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      // TODO: زبط الوضع تبع الدراور

      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else {
            final User? user = snapshot.data;
            if (user == null) {
              return PageviewWelcome();
            } else {
              return ChatScreen();
            }
          }
        },
      ),
    );
  }
}
