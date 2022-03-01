import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyMotorbikePageView extends StatelessWidget {
  const MyMotorbikePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Xe của tôi"),
        actions: [
          IconButton(
            splashRadius: 24,
            icon: const Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _buildContainerImage(),
              _buildTitleBody(context),
              _buildItem(context, title: "Nhớt"),
              _buildItem(context, title: "Dầu thắng")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.autorenew),
        onPressed: () {},
      ),
    );
  }

  Widget _buildItem(BuildContext context, {required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: double.infinity),
            child: LinearPercentIndicator(
              barRadius: const Radius.circular(10),
              lineHeight: 25,
              percent: 0.7,
              padding: const EdgeInsets.symmetric(vertical: 5),
              center: const Text(
                "50.0%",
                style: TextStyle(fontSize: 11.0),
              ),
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Thời gian thay",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                "Thời gian cần thay mới",
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "12/3/2021",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                "12/3/2022",
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildTitleBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        "Thông tin xe",
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Container _buildContainerImage() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 200,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: "https://images3.alphacoders.com/598/thumb-1920-598511.jpg",
      ),
    );
  }
}
