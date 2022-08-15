import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AppBackground{


  static AssetImage getCurrentAppBackground(){

var dateTime = DateTime.now();

String time=DateFormat('kk').format(dateTime);

if (int.parse(time)<6) {
return AssetImage('assets/images/dark.jpeg');
}

else if (int.parse(time)>18) {
return AssetImage('assets/images/nature.jpeg');
}
else{
  return AssetImage('assets/images/dark.jpeg');
}

  }
}