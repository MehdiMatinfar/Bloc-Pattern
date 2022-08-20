import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecase/current_weather_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_bloc.dart';

GetIt locator = GetIt.instance;

setup(){

  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));
  locator.registerSingleton<CurrentWeatherUseCase>(CurrentWeatherUseCase(locator()));
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));


}