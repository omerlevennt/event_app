import 'package:flutter/material.dart';

class PagePaddingSymetrict extends EdgeInsets {
  const PagePaddingSymetrict.horizontalNormal()
      : super.symmetric(horizontal: 20);
  const PagePaddingSymetrict.verticalNormal() : super.symmetric(vertical: 20);
  const PagePaddingSymetrict.verticalLowNormal()
      : super.symmetric(vertical: 10);
}
