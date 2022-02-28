import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/models/brand_car_model.dart';
import 'package:my_car_flutter_app/src/screens/select_car/select_car.dart';

class SelectCarPageView extends StatelessWidget {
  const SelectCarPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Select car"),
        actions: [
          IconButton(
              splashRadius: 24,
              onPressed: () {
                showSearch(context: context, delegate: Search());
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
    return BlocBuilder<SelectCarCubit, SelectCarState>(
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
        brandCar.brand,
        style: Theme.of(context).textTheme.headline5,
      ),
      children: brandCar.typeCar
          .map((e) => ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                title: Text(e.nameCar),
                onTap: () =>
                    Navigator.pushNamed(context, "/car_info", arguments: e),
              ))
          .toList(),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            color: const Color(0xff202c3b),
          ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: const Text("tmp"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("ff");
  }
}
