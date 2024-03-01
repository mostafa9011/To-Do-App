import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_state.dart';

class CubitSettings extends Cubit<StatesSettings> {
  CubitSettings(super.initialState);

  ThemeMode currentTheme = ThemeMode.light;

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
}
