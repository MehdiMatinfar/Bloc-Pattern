import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/app_background.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AppBackgroundImage.getCurrentAppBackground(),
                fit: BoxFit.cover)
        ),child: Center(child : Text('BookMark Screen',style: TextStyle(color: Colors.white),))
      ),
    );
  }
}
