import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/models/models.dart';
import 'package:my_car_flutter_app/src/screens/motorbike_info/car_info.dart';

class MotorbikeInfoPage extends StatelessWidget {
  const MotorbikeInfoPage({Key? key, required this.motorbike}) : super(key: key);
  final Motorbike motorbike;

  @override
  Widget build(BuildContext context) {
    log("Log:car_info_page");
    return BlocProvider(
      create: (_) => MotorbikeInfoCubit(),
      child: CarInfoPageView(
        motorbike: motorbike,
      ),
    );
  }
}
