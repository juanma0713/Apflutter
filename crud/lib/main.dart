import 'package:crud/pages/list_page.dart';
import 'package:crud/pages/login_screen.dart';
import 'package:crud/pages/save_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.ROUTE,
      routes:{
      LoginScreen.ROUTE : (_) => LoginScreen(),
      ListPage.ROUTE : (_) => ListPage(),
      SavePage.ROUTE : (_) => SavePage(),
      },
      
    );
  }
}