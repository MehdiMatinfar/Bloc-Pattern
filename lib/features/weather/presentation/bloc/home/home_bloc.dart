import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/domain/usecase/current_weather_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/current_weather_state.dart';

import '../../../../../core/params/forecast_params.dart';
import '../../../domain/usecase/forecast_7days_usecase.dart';
import 'forecast_7datys_state.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CurrentWeatherUseCase currentWeatherUseCase;
  final Forecast7DaysUsecase  forecast7DaysUsecase;

  HomeBloc(this.currentWeatherUseCase,this.forecast7DaysUsecase)
      : super(HomeState(currentWeatherState: CurrentWeatherLoading(),forecast7DaysState: Forecast7DaysLoading())) {
    /* At First Emit Data From Server  */
    on<LoadCurrentWeatherEvent>((event, emit) async {

      emit(state.copyWith(currentWeatherState: CurrentWeatherLoading()));

      DataState dataState = await currentWeatherUseCase.call(event.cityName!);


      if (dataState is DataStateSuccessfully) {

        emit(state.copyWith(currentWeatherState: CurrentWeatherCompleted(dataState.data)));
      }

      else if (dataState is DataStateError) {

        emit(state.copyWith(currentWeatherState: CurrentWeatherError(dataState.error)));
      }

    });

    // Load ForeCast

    on<LoadForecast7DaysEvent>((event, emit) async{

      emit(state.copyWith(forecast7DaysState: Forecast7DaysLoading()));

      DataState dataState = await forecast7DaysUsecase.call(event.params!);

      if (dataState is DataStateSuccessfully) {

        emit(state.copyWith(forecast7DaysState: Forecast7DaysCompleted(dataState.data)));
      }

      else if (dataState is DataStateError) {

        emit(state.copyWith(forecast7DaysState: Forecast7DaysError(dataState.error)));
      }
    });

  }
}
