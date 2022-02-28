part of 'add_my_motorbike_cubit.dart';

class AddMyMotorbikeState extends Equatable {
  const AddMyMotorbikeState({this.nameMotorbike = "", this.numberKm = 0});
  final String nameMotorbike;
  final int numberKm;

  @override
  List<Object> get props => [nameMotorbike, numberKm];

  AddMyMotorbikeState copyWith({
    String? nameMotorbike,
    int? numberKm,
  }) {
    return AddMyMotorbikeState(
      nameMotorbike: nameMotorbike ?? this.nameMotorbike,
      numberKm: numberKm ?? this.numberKm,
    );
  }
}
