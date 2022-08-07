import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/usecases/usecase_services.dart';
import 'package:weather_app/features/weather/domain/entity/current_city_entity.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class CurrentWeatherUseCase extends UseCaseServices<Future<DataState<CurrentCityEntity>>,String>{

  final WeatherRepository weatherRepository;

  CurrentWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(String p) async{
    return await weatherRepository.fetchCurrentWeatherData(p);
  }


}