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
  Widget _showPage =   HomeScreen();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context)
        .add(LoadCurrentWeatherEvent(cityName: 'Tehran'));
    int _page = 0;

    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 600),
        index: _page,
        height: 60,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.bookmark, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            _showPage = _pageChooser(index);
            print(index);
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
        break;

      case 1:
        return pages[1];
        break;



      default:
        return pages[0];
    }
  }

}

// class MainWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     PageController pc=PageController(initialPage: 0);
//     BlocProvider.of<HomeBloc>(context)
//         .add(LoadCurrentWeatherEvent(cityName: 'Tehran'));
//
//     return Scaffold(bottomNavigationBar:   CurvedNavigationBar(
//       backgroundColor: Colors.blueAccent,
//       items: <Widget>[
//         Icon(Icons.add, size: 30),
//         Icon(Icons.list, size: 30),
//       ],
//       onTap: (index) {
//         //Handle button tap
//       },
//     ),
//       body: BlocBuilder<HomeBloc, HomeState>(
//         builder: (context, state) {
//           if (state is CurrentWeatherLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is CurrentWeatherCompleted) {
//             return Center(
//               child: Text('Completed! '),
//             );
//           } else if (state is CurrentWeatherError) {
//             return Center(
//               child: Text('Error!'),
//             );
//           }
//           return Container(child: Text('Nothing!'),);
//         },
//       ),
//       appBar: AppBar(),
//     );
//   }
// }
