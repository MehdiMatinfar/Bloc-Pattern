import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/current_weather_state.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_bloc.dart';

class MainWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context)
        .add(LoadCurrentWeatherEvent(cityName: 'Tehran'));

    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is CurrentWeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CurrentWeatherCompleted) {
            return Center(
              child: Text('Completed! '),
            );
          } else if (state is CurrentWeatherError) {
            return Center(
              child: Text('Error!'),
            );
          }
          return Container(child: Text('Nothing!'),);
        },
      ),
      appBar: AppBar(),
    );
  }
}
