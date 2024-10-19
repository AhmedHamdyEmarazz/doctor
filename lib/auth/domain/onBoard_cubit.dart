import 'package:doctor/auth/domain/onBoard_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardCubit extends Cubit<OnBoardStates> {
  OnBoardCubit() : super(InitialState());

  int index = 1;

  void increment() {
    index++;
    emit(IncrementState());
  }

  void decrement() {
    index--;
    emit(DecrementState());
  }
}
