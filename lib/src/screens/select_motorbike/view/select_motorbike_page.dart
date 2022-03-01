import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/data/repository.dart';
import 'package:my_car_flutter_app/src/screens/select_motorbike/select_motorbike.dart';

class SelectMotorbikePage extends StatelessWidget {
  const SelectMotorbikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SelectMotorbikeCubit(repository: context.read<Repository>())
            ..loadingBrandCar(),
      child: const SelectMotorbikePageView(),
    );
  }
}
