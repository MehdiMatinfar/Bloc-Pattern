part of 'home_bloc.dart';

 class HomeState extends Equatable {

  CurrentWeatherState? currentWeatherState;
  Forecast7DaysState? forecast7DaysState;

  HomeState({required this.currentWeatherState,required this.forecast7DaysState});

  HomeState copyWith({CurrentWeatherState? currentWeatherState,Forecast7DaysState? forecast7DaysState}){
   
   return HomeState(currentWeatherState: currentWeatherState ?? this.currentWeatherState,forecast7DaysState: forecast7DaysState??this.forecast7DaysState);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [currentWeatherState,forecast7DaysState];
}

