import 'package:flutter/material.dart';

class UserAgeProvider extends ValueNotifier<int>{
  UserAgeProvider.instance() : super(0);
  static final UserAgeProvider _instance = UserAgeProvider.instance();
  factory UserAgeProvider() => _instance;

  void setAge(int age){
    value = age;
    notifyListeners();
  }
}