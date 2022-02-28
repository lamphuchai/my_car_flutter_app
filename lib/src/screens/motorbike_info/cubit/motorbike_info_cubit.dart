import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_car_flutter_app/src/models/models.dart';

part 'motorbike_info_state.dart';

class MotorbikeInfoCubit extends Cubit<MotorbikeInfoState> {
  MotorbikeInfoCubit() : super(const MotorbikeInfoState());

  void setIndexPage(int index) {
    emit(MotorbikeInfoState(indexPage: index));
  }
}
