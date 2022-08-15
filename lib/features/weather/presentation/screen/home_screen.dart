import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/bookmark/presentation/widget/app_background.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/current_weather_state.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context)
        .add(LoadCurrentWeatherEvent(cityName: 'Tehran'));
    return
    Container(
      height: MediaQuery.of(context).size.height,
     decoration:
      BoxDecoration(
          image: DecorationImage(
              image: AppBackground.getCurrentAppBackground(),
              fit: BoxFit.cover)
      ),
      child:

    BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          print("State : ${state.currentWeatherState}");
          if (state.currentWeatherState is CurrentWeatherLoading) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.currentWeatherState is CurrentWeatherCompleted) {
            return const Center(
              child: Text('Completed! '),
            );
          } else if(state.currentWeatherState is CurrentWeatherError) {
            return const Center(
              child: Text('Error!'),
            );
          }
          else{

            return const Center(
              child: Text('Nothing!'),
            );
          }
        },
      )
      ,
    );
  }
}
