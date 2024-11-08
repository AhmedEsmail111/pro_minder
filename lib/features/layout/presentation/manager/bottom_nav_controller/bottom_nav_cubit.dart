import 'package:bloc/bloc.dart';

import 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit() : super(BottomNavInitial());

  int currentIndex = 0;
  double scale = 1;
  void setCurrentIndex(int index) {
    currentIndex = index;
    emit(BottomNavChangeIndex());
  }

  void changeScale() {
    scale = 0.8;
    emit(BottomNavIncreaseScale());
    Future.delayed(const Duration(milliseconds: 201), () {
      scale = 1;
      emit(BottomNavResetScale());
    });
  }
}
