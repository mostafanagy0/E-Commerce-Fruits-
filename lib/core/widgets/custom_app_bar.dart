import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new)),
  );
}
