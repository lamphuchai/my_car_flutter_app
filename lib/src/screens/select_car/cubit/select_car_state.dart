part of 'select_car_cubit.dart';

class SelectCarState extends Equatable {
  const SelectCarState({this.brandCar = const <BrandCar>[]});
  final List<BrandCar> brandCar;

  @override
  List<Object> get props => [brandCar];
}
