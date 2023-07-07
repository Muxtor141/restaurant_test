import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:test_app/core/assets/constants/app_resources.dart';


Color fromHexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}


