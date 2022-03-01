import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeceff1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
        actions: const [
          // IconButton(
          //   splashRadius: 24,
          //   icon: const Icon(Icons.settings),
          //   onPressed: () {},
          // )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: Colors.amber[50],
                    borderRadius: BorderRadius.circular(13)),
                child: Text(
                  "Tra cứu thông số xe",
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "/select_motorbike"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.circular(13)),
                  child: Text(
                    "Quản lý xe của tôi",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () => Navigator.pushNamed(context, "/my_motorbike"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
