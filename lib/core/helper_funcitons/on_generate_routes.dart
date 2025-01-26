import 'package:flutter/material.dart';
import 'package:fruits_app/features/Splash/presentation/Views/splash_view.dart';
import 'package:fruits_app/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_app/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits_app/features/onBording/presentation/views/on_bording_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case OnBordingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBordingView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
