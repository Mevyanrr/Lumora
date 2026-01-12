import 'package:flutter/material.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      theme: ThemeData(fontFamily: 'poppins'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/kuisioner1',
      routes: {
        '/kuisioner1': (context) => const Page1(),
       
      },
    );
  }
}

