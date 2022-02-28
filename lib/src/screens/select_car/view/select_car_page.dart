import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/screens/select_car/select_car.dart';

class SelectCarPage extends StatelessWidget {
  const SelectCarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectCarCubit()..loadingBrandCar(),
      child: const SelectCarPageView(),
    );
  }
}
