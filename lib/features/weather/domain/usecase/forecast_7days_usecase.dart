import 'package:weather_app/core/params/forecast_params.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/usecases/usecase_services.dart';
import 'package:weather_app/features/weather/domain/entity/current_city_entity.dart';
import 'package:weather_app/features/weather/domain/entity/forecast_7days_entity.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class Forecast7DaysUsecase extends UseCaseServices<Future<DataState<Forecast7DaysEntity>>,ForecastParams>{

  final WeatherRepository weatherRepository;

  Forecast7DaysUsecase(this.weatherRepository);

  @override
  Future<DataState<Forecast7DaysEntity>> call(ForecastParams p) async{
    return await weatherRepository.fetchForecast7DaysData(p);
  }


}