// Place fonts/pageicon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: pageicon
//      fonts:
//       - asset: fonts/pageicon.ttf
import 'package:flutter/widgets.dart';

class PageIcon {
  PageIcon._();

  static const String _fontFamily = 'pageIcon';

  static const IconData heart = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData paper = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData profile = IconData(0xe903, fontFamily: _fontFamily);
}
