import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_motorbike_state.dart';

class MyMotorbikeCubit extends Cubit<MyMotorbikeState> {
  MyMotorbikeCubit() : super(MyMotorbikeInitial());
  void loadMyMotorbike() {}
  void upDateData() {}
  void deleteItem() {}
}
