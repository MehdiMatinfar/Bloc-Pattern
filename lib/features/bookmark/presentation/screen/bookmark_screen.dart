import 'package:flutter/material.dart';
import 'package:weather_app/features/bookmark/presentation/widget/app_background.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AppBackground.getCurrentAppBackground(),
              fit: BoxFit.cover)
      ),child: Center(child : Text('BookMark Screen',style: TextStyle(color: Colors.white),))
    );
  }
}
