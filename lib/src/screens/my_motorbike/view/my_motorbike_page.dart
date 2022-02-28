import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/screens/my_motorbike/my_motorbike.dart';

class MyMotorbikePage extends StatelessWidget {
  const MyMotorbikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyMotorbikeCubit(),
      child: const MyMotorbikePageView(),
    );
  }
}
