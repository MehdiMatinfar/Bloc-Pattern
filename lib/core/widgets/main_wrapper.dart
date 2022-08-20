import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/bookmark/presentation/screen/bookmark_screen.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_bloc.dart';
import 'package:weather_app/features/weather/presentation/screen/home_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  var pages = <Widget>[const HomeScreen(), const BookMarkScreen()];
  Widget _showPage =   const HomeScreen();

  @override
  Widget build(BuildContext context) {
    int _page = 0;

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.black87,
        animationDuration: const Duration(milliseconds: 600),
        index: _page,
        height: 60,
        items: const <Widget>[
          Icon(Icons.home, size: 30,color: Colors.white,),
          Icon(Icons.bookmark, size: 30,color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
        letIndexChange: (index) => true,
        animationCurve: Curves.easeInOut,
      ),
      body: _showPage

      ,
      extendBody: true,
    );
  }

  Widget _pageChooser(int page)
  {
    switch (page)
    {
      case 0:
        return pages[0];

      case 1:
        return pages[1];



      default:
        return pages[0];
    }
  }

}


