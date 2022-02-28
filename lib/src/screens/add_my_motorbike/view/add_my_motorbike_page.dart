import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/screens/add_my_motorbike/add_my_motorbike.dart';
import 'package:my_car_flutter_app/src/screens/add_my_motorbike/cubit/add_my_motorbike_cubit.dart';

class AddMyMotorbikePage extends StatelessWidget {
  const AddMyMotorbikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMyMotorbikeCubit(),
      child: const AddMyMotorbikePageView(),
    );
  }
}
