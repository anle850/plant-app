import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_v1/blocs/plant_cubit.dart';
import 'package:plant_v1/pages/onboarding_screen.dart';
import 'package:plant_v1/pages/root_page.dart';
import 'package:plant_v1/pages/screens/home_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => PlantCubit(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Onboarding Screen',
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
        // RootPage()
      );

  }
}
