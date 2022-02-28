import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_car_flutter_app/src/models/models.dart';

part 'select_car_state.dart';

class SelectCarCubit extends Cubit<SelectCarState> {
  SelectCarCubit() : super(const SelectCarState());
  void loadingBrandCar() {
    List<BrandCar> tmp = [
      BrandCar(brand: "Honda", typeCar: [
        Car(nameCar: "Honda CR15", images: [
          "https://cdn.wallpaperhub.app/cloudcache/d/b/b/8/2/b/dbb82b2a6bfb478d8725a87e79cb68517a9b0ccb.jpg",
          "https://cdn.wallpaperhub.app/cloudcache/f/a/9/3/c/5/fa93c558f352e89ff3a9f791984da555b546a34b.jpg",
          "https://cdn.wallpaperhub.app/cloudcache/5/8/7/d/e/5/587de526387609c89c678b28e2b52320a740704f.jpg"
        ])
      ])
    ];
    emit(SelectCarState(brandCar: tmp));
  }
}
