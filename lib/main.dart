

import 'package:cancer/pages/Getstart.dart';
import 'package:cancer/pages/Home/Home.dart';
import 'package:cancer/pages/Regsister/Register.dart';
import 'package:cancer/pages/Sigin/Sigin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Statemanagment/CubitSigin.dart';
import 'Statemanagment/CubitSignup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigInCubit(),
        ),
        BlocProvider(
          create: (context) => SigUpCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        initialRoute: '/',
        routes: {
          '/': (context) => const First(),

      'SigIn': (context) => Sigin(),
          'SigUp': (context) => Register(),
          'Home': (context) =>  Home(currentindex:0 ,),

        },
      ),
    );
  }
}
