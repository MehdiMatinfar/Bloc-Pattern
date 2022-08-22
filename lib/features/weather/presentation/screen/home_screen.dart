import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    PageController _pageController = PageController();
    return SafeArea(
      child: Container(
        height: height,
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
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.02),
                            child: SizedBox(
                              width: width,
                              height: height * 0.5,
                              child: PageView.builder(
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 50),
                                          child: Text(
                                            currentCityEntity.name!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Text(
                                            // 0 -> Current Weather
                                            // 1 -> Tomorrow
                                            currentCityEntity
                                                .weather![0].description!,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: WeatherImages.setIconForMain(
                                              currentCityEntity
                                                  .weather![0].description!),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Text(
                                            // 0 -> Current Weather
                                            // 1 -> Tomorrow
                                            "${currentCityEntity.main!.temp!
                                                .round()}\u00B0",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    'max',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    // 0 -> Current Weather
                                                    // 1 -> Tomorrow
                                                    "${currentCityEntity.main!
                                                        .tempMax!
                                                        .round()}\u00B0",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Container(
                                                  width: 1,
                                                  height: 40,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    'min',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    // 0 -> Current Weather
                                                    // 1 -> Tomorrow
                                                    "${currentCityEntity.main!
                                                        .tempMin!
                                                        .round()}\u00B0",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return Container(
                                      color: Colors.yellow,
                                    );
                                  }
                                },
                                physics: const AlwaysScrollableScrollPhysics(),
                                allowImplicitScrolling: true,
                                itemCount: 2,
                                controller: _pageController,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Center(
                              child: SmoothPageIndicator(
                                controller: _pageController,
                                count: 2,
                                effect: const ExpandingDotsEffect(
                                    dotWidth: 10,
                                    dotHeight: 10,
                                    spacing: 5,
                                    activeDotColor: Colors.white),
                                onDotClicked: (index) =>
                                   _pageController.animateToPage(index,
                                      duration: Duration(microseconds: 500),
                                      curve: Curves.bounceOut)
                                ,
                              ),
                            ),
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
