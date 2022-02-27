import 'package:flutter/material.dart';

class CarInfoPage extends StatefulWidget {
  const CarInfoPage({Key? key}) : super(key: key);

  @override
  State<CarInfoPage> createState() => _CarInfoPageState();
}

class _CarInfoPageState extends State<CarInfoPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //1
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  snap: false,
                  floating: true,
                  pinned: true,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: const Text('Honda XR15', textScaleFactor: 1),
                    background: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        PageView(
                          children: [
                            Image.network(
                              "https://cdn.wallpaperhub.app/cloudcache/5/8/7/d/e/5/587de526387609c89c678b28e2b52320a740704f.jpg",
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              "https://cdn.wallpaperhub.app/cloudcache/f/a/9/3/c/5/fa93c558f352e89ff3a9f791984da555b546a34b.jpg",
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              "https://cdn.wallpaperhub.app/cloudcache/d/b/b/8/2/b/dbb82b2a6bfb478d8725a87e79cb68517a9b0ccb.jpg",
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        Positioned(
                            bottom: 12,
                            height: 5,
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                height: 5,
                                width: size.width * 1 / 20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: Container(
            margin: EdgeInsets.only(top: size.height * 1 / 6),
            child: Text("ff"),
          )),
    );
  }
}
