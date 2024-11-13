import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0x00a00000),
              blurRadius: 9,
              offset: Offset(0, 2),
              spreadRadius: 0)
        ]),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              prefixIcon: SizedBox(
                  width: 20,
                  child: Center(child: SvgPicture.asset(Assets.imagesSearch))),
              hintStyle:
                  TextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
              suffixIcon: SizedBox(
                  width: 20,
                  child: Center(child: SvgPicture.asset(Assets.imagesFilter))),
              hintText: 'ابحث عن.......',
              filled: true,
              fillColor: Colors.white,
              border: buildBorder(),
              focusedBorder: buildBorder(),
              enabledBorder: buildBorder()),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
      width: 1,
      color: Colors.white,
    ),
  );
}
