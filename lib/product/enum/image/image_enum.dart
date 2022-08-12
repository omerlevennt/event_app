import 'package:flutter/material.dart';

enum ImageEnums { drawer, alarm, seach, party, illustration }

extension ImageEnumExtension on ImageEnums {
  String get _toPath => "asset/png/ic_$name.png";

  Image get ToImage => Image.asset(_toPath);
}
