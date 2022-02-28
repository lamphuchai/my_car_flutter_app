part of 'motorbike_info_cubit.dart';

class MotorbikeInfoState extends Equatable {
  const MotorbikeInfoState({this.indexPage = 0});
  final int indexPage;
  @override
  List<Object> get props => [indexPage];

  MotorbikeInfoState copyWith({
    int? indexPage,
    Motorbike? motorbike,
  }) {
    return MotorbikeInfoState(
      indexPage: indexPage ?? this.indexPage,

    );
  }
}
