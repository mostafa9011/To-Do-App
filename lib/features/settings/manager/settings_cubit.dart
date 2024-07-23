import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_state.dart';

class CubitSettings extends Cubit<StatesSettings> {
  CubitSettings(super.initialState);

  ThemeMode currentTheme = ThemeMode.light;
  DateTime selectedDate = DateTime.now();
  DateTime focusDate = DateTime.now();

  void swapToDarkTheme() {
    currentTheme = ThemeMode.dark;
    emit(DarkState());
  }

  void swapToLightTheme() {
    currentTheme = ThemeMode.light;
    emit(LightState());
  }

  bool isLight() {
    return currentTheme == ThemeMode.light;
  }

  onDateChanged() {
    focusDate = selectedDate;
    emit(UpdateDateState());
  }
}
