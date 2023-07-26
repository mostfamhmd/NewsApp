import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home_screen.dart';

import 'data/cubit/news_app_state_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppStateCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: HomeScreen(),
        ),
      ),
    );
  }
}
