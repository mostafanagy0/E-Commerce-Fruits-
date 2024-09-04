import 'package:flutter/material.dart';

void customPushNavigaton(BuildContext context, routeName) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => routeName),
  );
}

void customPushReplacementNavigaton(BuildContext context, routeName) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => routeName),
  );
}

void customPushReplacementNamedNavigaton(
    BuildContext context, String routeName) {
  Navigator.of(context).pushReplacementNamed(routeName);
}
