import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'floating_action_button_state.dart';

class FloatingActionButtonCubit extends Cubit<FloatingActionButtonStates> {
  FloatingActionButtonCubit() : super(FloatingActionButtonInitial());

  static FloatingActionButtonCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  bool isVisible = true;

  void hideButton() {
    isVisible = false;
    emit(HideButtonVisibility());
  }

  void showButton() {
    isVisible = true;
    emit(ShowButtonVisibility());
  }
}
