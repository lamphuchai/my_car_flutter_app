import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/app.dart';
import 'package:my_car_flutter_app/src/my_bloc_observer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: MyBlocObserver(),
  );
}
