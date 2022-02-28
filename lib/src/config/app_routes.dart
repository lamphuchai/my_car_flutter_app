import 'package:flutter/material.dart';
import 'package:my_car_flutter_app/src/models/models.dart';
import 'package:my_car_flutter_app/src/screens/car_info/view/view.dart';
import 'package:my_car_flutter_app/src/screens/home/home.dart';
import 'package:my_car_flutter_app/src/screens/manage_car/view/view.dart';
import 'package:my_car_flutter_app/src/screens/select_car/select_car.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    debugPrint('onGenerateRoute: ${settings.name}');
    switch (settings.name) {
      case '/':
        return PageTransition(
            child: const HomePage(),
            type: PageTransitionType.rightToLeftWithFade);
      case '/select_car':
        return PageTransition(
            child: const SelectCarPage(),
            type: PageTransitionType.rightToLeftWithFade);
      case '/car_info':
        if (args != null && args is Car) {
          return PageTransition(
              child:  CarInfoPage(car: args,),
              type: PageTransitionType.rightToLeftWithFade);
        }
        return _errorRoute();
      case '/manage_car':
        return PageTransition(
            child: const ManageCarPage(),
            type: PageTransitionType.rightToLeftWithFade);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
