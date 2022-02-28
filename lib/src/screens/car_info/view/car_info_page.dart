import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/models/models.dart';
import 'package:my_car_flutter_app/src/screens/car_info/cubit/car_info_cubit.dart';
import 'package:my_car_flutter_app/src/screens/car_info/view/view.dart';

class CarInfoPage extends StatelessWidget {
  const CarInfoPage({Key? key, required this.car}) : super(key: key);
  final Car car;

  @override
  Widget build(BuildContext context) {
    log("Log:car_info_page");
    return BlocProvider(
      create: (_) => CarInfoCubit(),
      child: CarInfoPageView(
        car: car,
      ),
    );
  }
}
