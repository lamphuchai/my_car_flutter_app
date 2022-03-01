import 'package:flutter/material.dart';
import 'package:my_car_flutter_app/src/models/models.dart';
import 'package:my_car_flutter_app/src/screens/add_my_motorbike/add_my_motorbike.dart';
import 'package:my_car_flutter_app/src/screens/home/home.dart';
import 'package:my_car_flutter_app/src/screens/motorbike_info/view/motorbike_info_page.dart';
import 'package:my_car_flutter_app/src/screens/my_motorbike/my_motorbike.dart';
import 'package:my_car_flutter_app/src/screens/select_motorbike/select_motorbike.dart';
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
      case '/select_motorbike':
        return PageTransition(
            child: const SelectMotorbikePage(),
            type: PageTransitionType.rightToLeftWithFade);
      case '/motorbike_info':
        if (args != null && args is Motorbike) {
          return PageTransition(
              child: MotorbikeInfoPage(
                motorbike: args,
              ),
              type: PageTransitionType.rightToLeftWithFade);
        }
        return _errorRoute();
      case "/add_my_motorbike":
        return PageTransition(
            child: const AddMyMotorbikePage(),
            type: PageTransitionType.rightToLeftWithFade);
      case '/my_motorbike':
        return PageTransition(
            child: const MyMotorbikePage(),
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
