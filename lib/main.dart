import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/ui_provider.dart';
import 'package:qr_reader/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Colors.deepPurpleAccent;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UiProvider()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: getApplicationRoutes(),
        //theme: ThemeData.dark()
        theme: ThemeData(
            primaryColor: colorTheme,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: colorTheme)),
      ),
    );
  }
}
