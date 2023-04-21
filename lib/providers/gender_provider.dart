import 'package:flutter/material.dart';

enum GenderSelect { female, male, both }

class GenderProvider extends ValueNotifier<GenderSelect> {
  GenderProvider.instance() : super(GenderSelect.female);
  static final GenderProvider _instance = GenderProvider.instance();

  factory GenderProvider() => _instance;

  void setGender(int index) {
    value = GenderSelect.values[index];
    notifyListeners();
  }
}
