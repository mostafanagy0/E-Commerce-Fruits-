import 'package:flutter/material.dart';
import 'package:fruits_app/features/Splash/presentation/On_Bording/presentation/views/on_bording_view.dart';
import 'package:fruits_app/features/Splash/presentation/Views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBordingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBordingView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
