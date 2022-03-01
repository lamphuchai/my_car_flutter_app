import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/config/extensions.dart';

import 'package:my_car_flutter_app/src/models/models.dart';
import 'package:my_car_flutter_app/src/screens/motorbike_info/cubit/motorbike_info_cubit.dart';

import 'package:my_car_flutter_app/src/widgets/app_button.dart';
import 'package:my_car_flutter_app/src/widgets/widgets.dart';

class CarInfoPageView extends StatelessWidget {
  const CarInfoPageView({Key? key, required this.motorbike}) : super(key: key);
  final Motorbike motorbike;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CustomSliverAppBar(motorbike: motorbike),
        const CustomSliverList()
      ],
    ));
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    required this.motorbike,
  }) : super(key: key);

  final Motorbike motorbike;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      snap: false,
      floating: true,
      pinned: true,
      expandedHeight: 200.0,
      actions: [
        IconButton(
            splashRadius: 24,
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  context: context,
                  builder: (context) => SizedBox(
                        height: 160,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 30, bottom: 15),
                              child: Text(
                                "Bạn muốn thêm vào xe của mình ??",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  AppButtonLong(
                                      color: Colors.red[200],
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "Trở lại",
                                        style:
                                            Theme.of(context).textTheme.button,
                                      )),
                                  AppButtonLong(
                                      color: Colors.green,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushNamed(
                                            context, "/add_my_motorbike");
                                      },
                                      child: Text(
                                        "OK",
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
            })
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(motorbike.nameMotorbike.toTitleCase(), textScaleFactor: 1),
        background: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            PageView(
              scrollBehavior:
                  const ScrollBehavior().copyWith(overscroll: false),
              onPageChanged: (value) =>
                  context.read<MotorbikeInfoCubit>().setIndexPage(value),
              children: motorbike.images
                  .map((url) => CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                          color: Colors.red,
                        )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ))
                  .toList(),
            ),
            Positioned(
                bottom: 9,
                height: 5,
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      BlocBuilder<MotorbikeInfoCubit, MotorbikeInfoState>(
                    builder: (context, state) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        height: 5,
                        width:
                            state.indexPage == index ? size.width * 1 / 15 : 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: const Center(
            child: Text("HONDA WINNER X - THÔNG SỐ KỸ THUẬT"),
          ),
        ),
        const ListTile(
          title: Text("Khối lượng bản thân"),
          trailing: Text("123kg-124kg"),
        ),
        const ListTile(
          title: Text("Dài x Rộng x Cao"),
          trailing: Text("2.019 x 727 x 1.088 mm"),
        ),
        const ListTile(
          title: Text("Khoảng cách trục bánh xe"),
          trailing: Text("1.278 mm"),
        ),
        const ListTile(
          title: Text("Độ cao yên"),
          trailing: Text("795 mm"),
        ),
        const ListTile(
          title: Text("Dung tích bình xăng"),
          trailing: Text("4,5 lít"),
        ),
        const ExpansionTile(
          expandedAlignment: Alignment.centerLeft,
          title: Text("Kích cỡ lớp trước/ sau"),
          children: [
            ListTile(
              title: Text("Trước"),
              trailing: Text("90/80-17M/C 46P"),
            ),
            ListTile(
              title: Text("Sau:"),
              trailing: Text("120/70-17M/C 58P"),
            ),
          ],
        ),
        const ListTile(
          title: Text("Phuộc trước"),
          trailing: Text("Ống lồng, giảm chấn thủy lực"),
        ),
        const ListTile(
          title: Text("Phuộc sau"),
          trailing: Text("Lò xo trụ đơn"),
        ),
        const ListTile(
          title: Text("Khoảng sáng gầm xe"),
          trailing: Text("150 mm"),
        ),
        const ExpansionTile(
          expandedAlignment: Alignment.centerLeft,
          title: Text("Dung tích nhớt máy"),
          children: [
            ListTile(
              title: Text("Khi thay nhớt"),
              trailing: Text("1.1 lít"),
            ),
            ListTile(
              title: Text("Khi rã máy"),
              trailing: Text("1.3 lít"),
            ),
          ],
        ),
        const ListTile(
          title: Text("Hệ thống truyền lực"),
          trailing: Text("Côn tay 6 số"),
        ),
        const ListTile(
          title: Text("Hệ thống khởi động"),
          trailing: Text("Điện"),
        ),
      ]),
    );
  }
}
