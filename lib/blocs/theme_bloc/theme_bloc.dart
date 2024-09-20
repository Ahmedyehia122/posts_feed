import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeLightState(ThemeData(brightness: Brightness.light))) {
    on<ToggleThemeEvent>((event, emit) {
      if (state is ThemeLightState) {
        emit(ThemeDarkState(ThemeData(brightness: Brightness.dark)));
      } else {
        emit(ThemeLightState(ThemeData(brightness: Brightness.light)));
      }
    });
  }
}
