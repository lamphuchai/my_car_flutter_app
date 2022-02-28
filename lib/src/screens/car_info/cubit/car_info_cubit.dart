import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_car_flutter_app/src/models/models.dart';

part 'car_info_state.dart';

class CarInfoCubit extends Cubit<CarInfoState> {
  CarInfoCubit() : super(const CarInfoState());

  void setIndexPage(int index) {
    emit(CarInfoState(indexPage: index));
  }
}
