import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_flutter_app/src/models/models.dart';
import 'package:my_car_flutter_app/src/screens/car_info/cubit/car_info_cubit.dart';

class CarInfoPageView extends StatelessWidget {
  const CarInfoPageView({Key? key, required this.car}) : super(key: key);
  final Car car;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _buildSliverAppBar(size, context),
        _buildSliverList(context),
      ],
    ));
  }

  SliverList _buildSliverList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1 / 2,
              color: Colors.red,
              height: 80,
            )
          ],
        )
      ]),
    );
  }

  SliverAppBar _buildSliverAppBar(Size size, BuildContext context) {
    return SliverAppBar(
      snap: false,
      floating: true,
      pinned: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text('Honda XR15', textScaleFactor: 1),
        ),
        background: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            PageView(
              onPageChanged: (value) =>
                  context.read<CarInfoCubit>().setIndexPage(value),
              children: car.images
                  .map((url) => Image.network(
                        url,
                        fit: BoxFit.cover,
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
                      BlocBuilder<CarInfoCubit, CarInfoState>(
                    builder: (context, state) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        height: 5,
                        width:
                            state.indexPage == index ? size.width * 1 / 20 : 8,
                        decoration: BoxDecoration(
                            color: Colors.white,
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
