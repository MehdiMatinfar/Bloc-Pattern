import '../../data/model/forecast_7days_model.dart';

class Forecast7DaysEntity{
  final double? lat;
  final double? lon;
  final String? timezone;
  final int? timezoneOffset;
  final  Current? current;
  final List<Daily>? daily;
  @override
  // TODO: implement props
  List<Object?> get props => [];

  Forecast7DaysEntity(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.daily});
}