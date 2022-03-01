import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/config/config.dart';
import 'package:my_car_flutter_app/src/data/repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Repository(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      title: 'My Motorbike',
      debugShowCheckedModeBanner: false,
      theme: ThemePrimary.theme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: "/",
    );
  }
}
