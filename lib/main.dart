import 'package:flutter/material.dart';
import 'package:qr_reader/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final colorTheme = Colors.deepPurpleAccent;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: getApplicationRoutes(),
      //theme: ThemeData.dark()
      theme: ThemeData(
        primaryColor: colorTheme,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorTheme
        )

      ),
    );
  }
}