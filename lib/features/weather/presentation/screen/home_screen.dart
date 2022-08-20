import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/app_background.dart';
import 'package:weather_app/core/widgets/spinkit.dart';
import 'package:weather_app/features/weather/domain/entity/current_city_entity.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/current_weather_state.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_bloc.dart';

import '../../../../core/widgets/weather_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context)
        .add(LoadCurrentWeatherEvent(cityName: 'Tehran'));

    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AppBackgroundImage.getCurrentAppBackground(),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            BlocConsumer<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.currentWeatherState is CurrentWeatherLoading) {
                  return const Expanded(
                    child: LoaderIndicator(),
                  );
                } else if (state.currentWeatherState
                    is CurrentWeatherCompleted) {
                  final CurrentWeatherCompleted currentWeatherCompleted =
                      state.currentWeatherState as CurrentWeatherCompleted;
                  final CurrentCityEntity currentCityEntity =
                      currentWeatherCompleted.currentCityEntity!;
                  return Expanded(
                      child: ListView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(
                              currentCityEntity.name!,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              // 0 -> Current Weather
                              // 1 -> Tomorrow
                              currentCityEntity.weather![0].description!,
                              style:
                              TextStyle(color: Colors.grey, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: WeatherImages.setIconForMain(currentCityEntity.weather![0].description!),
                          )
                        ],
                      )
                    ],
                  ));
                } else if (state.currentWeatherState is CurrentWeatherError) {
                  return const Center(
                    child: Text('Error!'),
                  );
                } else {
                  return const Center(
                    child: Text('Nothing!'),
                  );
                }
              },
              listener: (context, state) {},
            ),
          ],
        ),
      ),
    );
  }
}
