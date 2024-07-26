import 'package:flutter/material.dart';
import 'package:hrms_admin/pages/main_page.dart';
import 'package:hrms_admin/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],

      child: const MyApp(),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const MainPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}


