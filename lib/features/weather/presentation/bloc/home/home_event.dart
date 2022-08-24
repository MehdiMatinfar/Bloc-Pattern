part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {



}
class LoadCurrentWeatherEvent extends HomeEvent{

  String? cityName;

  LoadCurrentWeatherEvent({this.cityName});
}
class LoadForecast7DaysEvent extends HomeEvent{

  ForecastParams? params;

  LoadForecast7DaysEvent({this.params});
}
