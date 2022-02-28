part of 'car_info_cubit.dart';

class CarInfoState extends Equatable {
  const CarInfoState({this.indexPage = 0});
  final int indexPage;
  @override
  List<Object> get props => [indexPage];

  CarInfoState copyWith({
    int? indexPage,
    Car? car,
  }) {
    return CarInfoState(
      indexPage: indexPage ?? this.indexPage,

    );
  }
}
