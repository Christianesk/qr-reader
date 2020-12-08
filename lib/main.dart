import 'package:flutter/material.dart';
import 'package:qr_reader/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Reader',
      initialRoute: 'home',
      routes: getApplicationRoutes(),
    );
  }
}