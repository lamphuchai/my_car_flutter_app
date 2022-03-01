import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/config/config.dart';
import 'package:my_car_flutter_app/src/models/brand_car_model.dart';
import 'package:my_car_flutter_app/src/screens/select_motorbike/select_motorbike.dart';

class SelectMotorbikePageView extends StatelessWidget {
  const SelectMotorbikePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tra cứu thông tin xe"),
        actions: [
          IconButton(
              splashRadius: 24,
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchMotorbike(
                        context.read<SelectMotorbikeCubit>().state.brandCar));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: _buildListView(context),
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return BlocBuilder<SelectMotorbikeCubit, SelectMotorbikeState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          children: state.brandCar
              .map((e) => _buildExpansionTile(context, e))
              .toList(),
        );
      },
    );
  }

  ExpansionTile _buildExpansionTile(BuildContext context, BrandCar brandCar) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      title: Text(
        brandCar.brand.toTitleCase(),
        style: Theme.of(context).textTheme.headline5,
      ),
      children: brandCar.typeMotorbike
          .map((e) => ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                title: Text(e.nameMotorbike.toTitleCase()),
                onTap: () => Navigator.pushNamed(context, "/motorbike_info",
                    arguments: e),
              ))
          .toList(),
    );
  }
}
