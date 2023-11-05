import 'package:flutter/cupertino.dart';

class AppConstants {
  static String get mochiVersion => "2.0";
  static String get baseApiUrl =>
      "https://chinese-api-test.mochidemy.com/api/v1/";
  static String get API_KEY =>
      "2b99ab55022a4307d5d031a92de3b30759db30f3c71b5a2690c8a42e7e8f7aeae9516284ff0444b3aac4dcbc8604f33c9dca9eb524a171dd66b96cce217d1952";

  static double get minTableWidth => 820;
  static double get minDesktopWidth => 1090;

  static final GlobalKey keyOfMaterial = GlobalKey();
}
