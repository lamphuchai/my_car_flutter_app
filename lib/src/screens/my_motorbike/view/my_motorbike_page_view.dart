import 'package:flutter/material.dart';

class MyMotorbikePageView extends StatelessWidget {
  const MyMotorbikePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My xe"),
      ),
    );
  }
}
