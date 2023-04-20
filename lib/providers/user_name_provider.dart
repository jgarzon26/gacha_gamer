import 'package:flutter/material.dart';

class UserNameProvider extends ValueNotifier<String>{
  UserNameProvider.instance() : super("");
  static final UserNameProvider _instance = UserNameProvider.instance();
  factory UserNameProvider() => _instance;

  void setName(String name){
    value = name;
    notifyListeners();
  }
}