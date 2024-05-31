import 'package:car_spotter/ui/screens/screen1.dart';
import 'package:car_spotter/ui/screens/screen2.dart';
import 'package:car_spotter/ui/screens/screen3.dart';
import 'package:car_spotter/ui/screens/screen4.dart';
import 'package:flutter/material.dart';

class ScreenList {
  final List<Widget> screens = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
    const Screen4(),
  ];
}