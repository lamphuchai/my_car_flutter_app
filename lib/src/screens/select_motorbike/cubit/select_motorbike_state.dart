part of 'select_motorbike_cubit.dart';

class SelectMotorbikeState extends Equatable {
  const SelectMotorbikeState({this.brandCar = const <BrandCar>[]});
  final List<BrandCar> brandCar;

  @override
  List<Object> get props => [brandCar];
}
