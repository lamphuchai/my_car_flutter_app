import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_car_flutter_app/src/models/models.dart';

part 'select_motorbike_state.dart';

class SelectMotorbikeCubit extends Cubit<SelectMotorbikeState> {
  SelectMotorbikeCubit() : super(const SelectMotorbikeState());
  void loadingBrandCar() {
    List<BrandCar> tmp = [
      BrandCar(brand: "honda", typeMotorbike: [
        Motorbike(nameMotorbike: "honda cr15", images: [
          "https://cdn.wallpaperhub.app/cloudcache/d/b/b/8/2/b/dbb82b2a6bfb478d8725a87e79cb68517a9b0ccb.jpg",
          "https://cdn.wallpaperhub.app/cloudcache/f/a/9/3/c/5/fa93c558f352e89ff3a9f791984da555b546a34b.jpg",
          "https://cdn.wallpaperhub.app/cloudcache/5/8/7/d/e/5/587de526387609c89c678b28e2b52320a740704f.jpg"
        ]),
        Motorbike(nameMotorbike: "honda 1", images: [
          "http://hd.wallpaperswide.com/thumbs/roewe_i6_max_car-t2.jpg",
          "http://hd.wallpaperswide.com/thumbs/porsche_917_living_legend_car-t2.jpg",
          "http://hd.wallpaperswide.com/thumbs/aprilia_rsv4_yellow_motorcycle-t2.jpg"
        ]),
        Motorbike(nameMotorbike: "honda 2", images: [
          "http://hd.wallpaperswide.com/thumbs/honda_cbr_motorcycle-t2.jpg",
          "http://hd.wallpaperswide.com/thumbs/yamaha_motorcycle-t2.jpg",
          "http://hd.wallpaperswide.com/thumbs/motocross_jumps-t2.jpg"
        ])
      ]),
      BrandCar(brand: "yamaha", typeMotorbike: [
        Motorbike(nameMotorbike: "exciter 155", images: [
          "https://cdn.wallpaperhub.app/cloudcache/d/b/b/8/2/b/dbb82b2a6bfb478d8725a87e79cb68517a9b0ccb.jpg",
          "https://cdn.wallpaperhub.app/cloudcache/f/a/9/3/c/5/fa93c558f352e89ff3a9f791984da555b546a34b.jpg",
          "https://cdn.wallpaperhub.app/cloudcache/5/8/7/d/e/5/587de526387609c89c678b28e2b52320a740704f.jpg"
        ]),
        Motorbike(nameMotorbike:  "honda 1", images: [
          "http://hd.wallpaperswide.com/thumbs/roewe_i6_max_car-t2.jpg",
          "http://hd.wallpaperswide.com/thumbs/porsche_917_living_legend_car-t2.jpg",
          "http://hd.wallpaperswide.com/thumbs/aprilia_rsv4_yellow_motorcycle-t2.jpg"
        ]),
      ])
    ];
    emit(SelectMotorbikeState(brandCar: tmp));
  }
}
