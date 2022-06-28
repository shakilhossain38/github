import 'package:flutter_driver/flutter_driver.dart';

class Keys {
  //common keys
  static final backButton = find.byTooltip('Back');

  // dashboard keys
  static final homeAppbarKey = find.byValueKey('homeAppbarKey');
  static final homePopupMeuKey = find.byValueKey('homePopupMeuKey');
  static final sortKey = find.byValueKey('sortKey');
  static final projectCard0 = find.byValueKey('projectCard0');
  static final projectCard7 = find.byValueKey('projectCard7');
}
