
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth_services.dart';
import '../provider/theme_provider.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    required AuthenticationServices authenticationServices,
  }) : _authenticationServices = authenticationServices;

  final AuthenticationServices _authenticationServices;

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: ListView(
        children: [

          CheckboxListTile(
              title: Text("Dark Theme"),

              value: themeProvider.isDarkMode    , onChanged: (val){
            themeProvider.toggleTheme();
          }),

          SwitchListTile(value:  themeProvider.isDarkMode  , onChanged: (val){
            themeProvider.toggleTheme();

          },
          title: Text("Dark Theme"),
          ),


          ListTile(
            title: Text("Sign Out"),
            leading: Icon(Icons.logout),
            onTap: () async {
              await _authenticationServices.signOut();
            },
          ),
        ],
      ),
    );
  }
}
