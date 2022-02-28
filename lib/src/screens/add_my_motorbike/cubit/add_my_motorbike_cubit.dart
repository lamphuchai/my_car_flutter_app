import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_my_motorbike_state.dart';

class AddMyMotorbikeCubit extends Cubit<AddMyMotorbikeState> {
  AddMyMotorbikeCubit() : super(const AddMyMotorbikeState());
  void changeNameMotorbike(String value) {
    emit(state.copyWith(nameMotorbike: value));
  }

  void changeNumberKm(int value) {
    emit(state.copyWith(numberKm: value));
  }
}
