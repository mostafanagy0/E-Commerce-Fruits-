import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper_funcitons/on_generate_routes.dart';
import 'package:fruits_app/features/Splash/presentation/Views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
    );
  }
}
