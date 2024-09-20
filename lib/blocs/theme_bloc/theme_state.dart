// theme_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeLightState extends ThemeState {
  final ThemeData themeData;

  const ThemeLightState(this.themeData);
}

class ThemeDarkState extends ThemeState {
  final ThemeData themeData;

  const ThemeDarkState(this.themeData);
}
