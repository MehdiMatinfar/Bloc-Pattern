import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/domain/usecase/current_weather_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/current_weather_state.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CurrentWeatherUseCase currentWeatherUseCase;

  HomeBloc(this.currentWeatherUseCase)
      : super(HomeState(currentWeatherState: CurrentWeatherLoading())) {
    /* At First Emit Data From Server  */
    on<LoadCurrentWeatherEvent>((event, emit) async {
      emit(state.copyWith(currentWeatherState: CurrentWeatherLoading()));
      DataState dataState = await currentWeatherUseCase.call(event.cityName!);
      if (dataState is DataStateSuccessfully) {
        emit(state.copyWith(
            currentWeatherState: CurrentWeatherCompleted(dataState.data)));
      } else if (dataState is DataStateError) {
        emit(state.copyWith(
            currentWeatherState: CurrentWeatherError(dataState.error)));
      }
    });
  }
}
