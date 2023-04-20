import 'package:flutter/material.dart';

enum Gender { female, male, both }

class GenderProvider extends ValueNotifier<Gender> {
  GenderProvider.instance() : super(Gender.female);
  static final GenderProvider _instance = GenderProvider.instance();

  factory GenderProvider() => _instance;

  void setGender(int index) {
    value = Gender.values[index];
    notifyListeners();
  }
}
