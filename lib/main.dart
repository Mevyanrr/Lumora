import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page1.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page2.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page3.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page3.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KuisionerBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'poppins'),
        initialRoute: '/kuisioner1',
        routes: {
          '/kuisioner1': (context) => Page1(),
          '/kuisioner2': (context) => Page2(),
          '/kuisioner3': (context) => Page3(),
          '/kuisioner4': (context) => Page4(),
        },
      ),
    );
  }
}
