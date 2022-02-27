import 'package:flutter/material.dart';
import 'package:my_car_flutter_app/src/config/config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      title: 'My Car',
      debugShowCheckedModeBanner: false,
      theme: ThemePrimary.theme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: "/",
    );
  }
}
