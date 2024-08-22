import 'package:flutter/material.dart';
import 'package:fruits_app/features/onBording/presentation/widgets/on_bording_view_body.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});
  static const String routeName = "OnBording";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBordingViewBody(),
    );
  }
}
