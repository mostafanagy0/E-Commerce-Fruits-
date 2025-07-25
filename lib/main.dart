import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_app/core/helper_funcitons/functions/get_it.dart';
import 'package:fruits_app/core/helper_funcitons/on_generate_routes.dart';
import 'package:fruits_app/core/services/shered_ferfernces_singleton.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/features/Splash/presentation/Views/splash_view.dart';
import 'package:fruits_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
          )),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
    );
  }
}
