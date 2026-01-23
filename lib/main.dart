import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/auth/presentation/pages/login.dart';
import 'package:lumora/features/auth/presentation/pages/regist.dart';
import 'package:lumora/features/home/presentation/pages/data_bayi.dart';
import 'package:lumora/features/home/presentation/pages/home_page.dart';
import 'package:lumora/features/home/presentation/pages/nutriguide.dart';
import 'package:lumora/features/home/presentation/pages/tahapan_bayi.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page1.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page2.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page3.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page4.dart';
import 'package:lumora/features/onBoarding/presentation/pages/onboarding3.dart';
import 'package:lumora/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:lumora/features/profile/presentation/pages/profile.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_bloc.dart';
import 'package:lumora/features/stimulasi/presentation/pages/stimulasi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      statusBarIconBrightness: Brightness.dark, // icon hitam
      statusBarBrightness: Brightness.light, // iOS
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KuisionerBloc>(create: (_) => KuisionerBloc()),
        BlocProvider(create: (_) => ProfileBloc()),
        BlocProvider<AktivitasBloc>(create: (_) => AktivitasBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          fontFamily: 'Poppins',
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.radio;
              }
              return AppColors.txtPrimary;
            }),
          ),
        ),

        initialRoute: '/home',
        routes: {
          '/kuisioner1': (context) => Page1(),
          '/kuisioner2': (context) => Page2(),
          '/kuisioner3': (context) => Page3(),
          '/kuisioner4': (context) => Page4(),
          '/onboarding3': (context) => Onboarding3(),
          '/login': (context) => Login(),
          '/regist': (context) => Regist(),
          '/home': (context) => HomePage(),
          '/babystep': (context) => TahapanBayi(),
          '/databayi': (context) => DataBayi(),
          '/nutriguide': (context) => Nutriguide(),
          '/profil': (context) => Profile(),
          '/stimulasi': (context) => Stimulasi(),
        },
      ),
    );
  }
}
