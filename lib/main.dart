import 'package:api/controller/dictionary_api_cubit/dictionary_api_cubit.dart';
import 'package:api/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/login_api_cubit/login_api_cubit.dart';
import 'controller/signup_api_cubit/sign_up_api_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpApiCubit(),
        ),
        BlocProvider(
          create: (context) => LoginApiCubit(),
        ),
        BlocProvider(
          create: (context) => DictionaryApiCubit(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
