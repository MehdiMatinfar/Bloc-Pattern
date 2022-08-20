import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/utils/time_picker.dart';

class AppBackgroundImage {
  static AssetImage getCurrentAppBackground() {
    var time = TimePicker.current_time;
    if (int.parse(time) < 6) {
      return AssetImage('assets/images/dark.jpeg');
    } else if (int.parse(time) > 18) {
      return AssetImage('assets/images/nature.jpeg');
    } else {
      return AssetImage('assets/images/dark.jpeg');
    }
  }
}
