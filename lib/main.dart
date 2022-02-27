import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_car_flutter_app/src/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const App());
}

