part of 'home_bloc.dart';

 class HomeState {

  CurrentWeatherState? currentWeatherState;

  HomeState({required this.currentWeatherState});

  HomeState copyWith({CurrentWeatherState? currentWeatherState}){
   
   return HomeState(currentWeatherState: currentWeatherState ?? this.currentWeatherState);
  }
}

