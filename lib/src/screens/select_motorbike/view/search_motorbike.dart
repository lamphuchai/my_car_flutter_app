import 'package:flutter/material.dart';
import 'package:my_car_flutter_app/src/config/config.dart';
import 'package:my_car_flutter_app/src/models/models.dart';

class SearchMotorbike extends SearchDelegate {
  final List<BrandCar> branCar;

  SearchMotorbike(this.branCar);

  @override
  String get searchFieldLabel => 'Tìm kiếm';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      appBarTheme: Theme.of(context).appBarTheme.copyWith(elevation: 0),
      hintColor: Colors.white,
      primaryColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          labelStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            query = "";
            showSuggestions(context);
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    List<Motorbike> tst = [];
    for (BrandCar tmp in branCar) {
      List<Motorbike> motorbike = tmp.typeMotorbike
          .where((e) => e.nameMotorbike.toLowerCase().contains(query))
          .toList();
      tst.addAll(motorbike);
    }
    if (tst.isEmpty) {
      return Center(
        child: Text("Không tìm thấy !!",
            style: Theme.of(context).textTheme.headline4),
      );
    } else {
      return ListView(
        children: tst
            .map((motorbike) => ListTile(
                  title: Text(motorbike.nameMotorbike.toTitleCase(),
                      style: Theme.of(context).textTheme.headline5),
                  onTap: () => Navigator.pushNamed(context, "/motorbike_info",
                      arguments: motorbike),
                ))
            .toList(),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return ListTile(
        leading: const Icon(Icons.search),
        title: Text(query, style: Theme.of(context).textTheme.headline5),
        onTap: () => showResults(context),
      );
    }
  }
}
