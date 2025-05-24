import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/pages/bonus_page.dart';
import 'package:airplane/ui/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:airplane/ui/pages/splash_page.dart';
import 'package:airplane/ui/pages/get_started_page.dart';
import 'package:airplane/ui/pages/sign_up_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
        },
      ),
    );
  }
}