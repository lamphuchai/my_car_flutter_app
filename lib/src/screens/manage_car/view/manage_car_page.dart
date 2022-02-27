import 'package:flutter/material.dart';

class ManageCarPage extends StatelessWidget {
  const ManageCarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quản lý xe tôi"),
      ),
    );
  }
}
