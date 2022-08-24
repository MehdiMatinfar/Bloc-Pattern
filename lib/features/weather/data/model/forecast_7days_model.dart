import 'package:weather_app/features/weather/domain/entity/forecast_7days_entity.dart';

class Forecast7DaysModel extends Forecast7DaysEntity{
  double? _lat;
  double? _lon;
  String? _timezone;
  int? _timezoneOffset;
  Current? _current;
  List<Daily>? _daily;

  Forecast7DaysModel(
      {double? lat,
      double? lon,
      String? timezone,
      int? timezoneOffset,
      Current? current,
      List<Daily>? daily}) {
    if (lat != null) {
      this._lat = lat;
    }
    if (lon != null) {
      this._lon = lon;
    }
    if (timezone != null) {
      this._timezone = timezone;
    }
    if (timezoneOffset != null) {
      this._timezoneOffset = timezoneOffset;
    }
    if (current != null) {
      this._current = current;
    }
    if (daily != null) {
      this._daily = daily;
    }
  }

  double? get lat => _lat;

  set lat(double? lat) => _lat = lat;

  double? get lon => _lon;

  set lon(double? lon) => _lon = lon;

  String? get timezone => _timezone;

  set timezone(String? timezone) => _timezone = timezone;

  int? get timezoneOffset => _timezoneOffset;

  set timezoneOffset(int? timezoneOffset) => _timezoneOffset = timezoneOffset;

  Current? get current => _current;

  set current(Current? current) => _current = current;

  List<Daily>? get daily => _daily;

  set daily(List<Daily>? daily) => _daily = daily;

  factory Forecast7DaysModel.fromJson(Map<String, dynamic> json) {
   List<Daily> daily=[];
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily.add( Daily.fromJson(v));
      });
    }

    return Forecast7DaysModel(
        lat: json['lat'],
        lon: json['lon'],
        timezone: json['timezone'],
        timezoneOffset: json['timezone_offset'],
      current: json['current'] != null ? new Current.fromJson(json['current']) : null,
      daily: daily
    );



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    data['timezone'] = this._timezone;
    data['timezone_offset'] = this._timezoneOffset;
    if (this._current != null) {
      data['current'] = this._current!.toJson();
    }
    if (this._daily != null) {
      data['daily'] = this._daily!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Current {
  int? _dt;
  int? _sunrise;
  int? _sunset;
  double? _temp;
  double? _feelsLike;
  int? _pressure;
  int? _humidity;
  double? _dewPoint;
  double? _uvi;
  int? _clouds;
  int? _visibility;
  double? _windSpeed;
  int? _windDeg;
  List<Weather>? _weather;

  Current(
      {int? dt,
      int? sunrise,
      int? sunset,
      double? temp,
      double? feelsLike,
      int? pressure,
      int? humidity,
      double? dewPoint,
      double? uvi,
      int? clouds,
      int? visibility,
      double? windSpeed,
      int? windDeg,
      List<Weather>? weather}) {
    if (dt != null) {
      this._dt = dt;
    }
    if (sunrise != null) {
      this._sunrise = sunrise;
    }
    if (sunset != null) {
      this._sunset = sunset;
    }
    if (temp != null) {
      this._temp = temp;
    }
    if (feelsLike != null) {
      this._feelsLike = feelsLike;
    }
    if (pressure != null) {
      this._pressure = pressure;
    }
    if (humidity != null) {
      this._humidity = humidity;
    }
    if (dewPoint != null) {
      this._dewPoint = dewPoint;
    }
    if (uvi != null) {
      this._uvi = uvi;
    }
    if (clouds != null) {
      this._clouds = clouds;
    }
    if (visibility != null) {
      this._visibility = visibility;
    }
    if (windSpeed != null) {
      this._windSpeed = windSpeed;
    }
    if (windDeg != null) {
      this._windDeg = windDeg;
    }
    if (weather != null) {
      this._weather = weather;
    }
  }

  int? get dt => _dt;

  set dt(int? dt) => _dt = dt;

  int? get sunrise => _sunrise;

  set sunrise(int? sunrise) => _sunrise = sunrise;

  int? get sunset => _sunset;

  set sunset(int? sunset) => _sunset = sunset;

  double? get temp => _temp;

  set temp(double? temp) => _temp = temp;

  double? get feelsLike => _feelsLike;

  set feelsLike(double? feelsLike) => _feelsLike = feelsLike;

  int? get pressure => _pressure;

  set pressure(int? pressure) => _pressure = pressure;

  int? get humidity => _humidity;

  set humidity(int? humidity) => _humidity = humidity;

  double? get dewPoint => _dewPoint;

  set dewPoint(double? dewPoint) => _dewPoint = dewPoint;

  double? get uvi => _uvi;

  set uvi(double? uvi) => _uvi = uvi;

  int? get clouds => _clouds;

  set clouds(int? clouds) => _clouds = clouds;

  int? get visibility => _visibility;

  set visibility(int? visibility) => _visibility = visibility;

  double? get windSpeed => _windSpeed;

  set windSpeed(double? windSpeed) => _windSpeed = windSpeed;

  int? get windDeg => _windDeg;

  set windDeg(int? windDeg) => _windDeg = windDeg;

  List<Weather>? get weather => _weather;

  set weather(List<Weather>? weather) => _weather = weather;

  Current.fromJson(Map<String, dynamic> json) {
    _dt = json['dt'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _dewPoint = json['dew_point'];
    _uvi = json['uvi'];
    _clouds = json['clouds'];
    _visibility = json['visibility'];
    _windSpeed = json['wind_speed'];
    _windDeg = json['wind_deg'];
    if (json['weather'] != null) {
      _weather = <Weather>[];
      json['weather'].forEach((v) {
        _weather!.add(new Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this._dt;
    data['sunrise'] = this._sunrise;
    data['sunset'] = this._sunset;
    data['temp'] = this._temp;
    data['feels_like'] = this._feelsLike;
    data['pressure'] = this._pressure;
    data['humidity'] = this._humidity;
    data['dew_point'] = this._dewPoint;
    data['uvi'] = this._uvi;
    data['clouds'] = this._clouds;
    data['visibility'] = this._visibility;
    data['wind_speed'] = this._windSpeed;
    data['wind_deg'] = this._windDeg;
    if (this._weather != null) {
      data['weather'] = this._weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weather {
  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  Weather({int? id, String? main, String? description, String? icon}) {
    if (id != null) {
      this._id = id;
    }
    if (main != null) {
      this._main = main;
    }
    if (description != null) {
      this._description = description;
    }
    if (icon != null) {
      this._icon = icon;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  String? get main => _main;

  set main(String? main) => _main = main;

  String? get description => _description;

  set description(String? description) => _description = description;

  String? get icon => _icon;

  set icon(String? icon) => _icon = icon;

  Weather.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['main'] = this._main;
    data['description'] = this._description;
    data['icon'] = this._icon;
    return data;
  }
}

class Daily {
  int? _dt;
  int? _sunrise;
  int? _sunset;
  int? _moonrise;
  int? _moonset;
  double? _moonPhase;
  Temp? _temp;
  FeelsLike? _feelsLike;
  int? _pressure;
  int? _humidity;
  double? _dewPoint;
  double? _windSpeed;
  int? _windDeg;
  double? _windGust;
  List<Weather>? _weather;
  int? _clouds;
  int? _pop;
  double? _uvi;

  Daily(
      {int? dt,
      int? sunrise,
      int? sunset,
      int? moonrise,
      int? moonset,
      double? moonPhase,
      Temp? temp,
      FeelsLike? feelsLike,
      int? pressure,
      int? humidity,
      double? dewPoint,
      double? windSpeed,
      int? windDeg,
      double? windGust,
      List<Weather>? weather,
      int? clouds,
      int? pop,
      double? uvi}) {
    if (dt != null) {
      this._dt = dt;
    }
    if (sunrise != null) {
      this._sunrise = sunrise;
    }
    if (sunset != null) {
      this._sunset = sunset;
    }
    if (moonrise != null) {
      this._moonrise = moonrise;
    }
    if (moonset != null) {
      this._moonset = moonset;
    }
    if (moonPhase != null) {
      this._moonPhase = moonPhase;
    }
    if (temp != null) {
      this._temp = temp;
    }
    if (feelsLike != null) {
      this._feelsLike = feelsLike;
    }
    if (pressure != null) {
      this._pressure = pressure;
    }
    if (humidity != null) {
      this._humidity = humidity;
    }
    if (dewPoint != null) {
      this._dewPoint = dewPoint;
    }
    if (windSpeed != null) {
      this._windSpeed = windSpeed;
    }
    if (windDeg != null) {
      this._windDeg = windDeg;
    }
    if (windGust != null) {
      this._windGust = windGust;
    }
    if (weather != null) {
      this._weather = weather;
    }
    if (clouds != null) {
      this._clouds = clouds;
    }
    if (pop != null) {
      this._pop = pop;
    }
    if (uvi != null) {
      this._uvi = uvi;
    }
  }

  int? get dt => _dt;

  set dt(int? dt) => _dt = dt;

  int? get sunrise => _sunrise;

  set sunrise(int? sunrise) => _sunrise = sunrise;

  int? get sunset => _sunset;

  set sunset(int? sunset) => _sunset = sunset;

  int? get moonrise => _moonrise;

  set moonrise(int? moonrise) => _moonrise = moonrise;

  int? get moonset => _moonset;

  set moonset(int? moonset) => _moonset = moonset;

  double? get moonPhase => _moonPhase;

  set moonPhase(double? moonPhase) => _moonPhase = moonPhase;

  Temp? get temp => _temp;

  set temp(Temp? temp) => _temp = temp;

  FeelsLike? get feelsLike => _feelsLike;

  set feelsLike(FeelsLike? feelsLike) => _feelsLike = feelsLike;

  int? get pressure => _pressure;

  set pressure(int? pressure) => _pressure = pressure;

  int? get humidity => _humidity;

  set humidity(int? humidity) => _humidity = humidity;

  double? get dewPoint => _dewPoint;

  set dewPoint(double? dewPoint) => _dewPoint = dewPoint;

  double? get windSpeed => _windSpeed;

  set windSpeed(double? windSpeed) => _windSpeed = windSpeed;

  int? get windDeg => _windDeg;

  set windDeg(int? windDeg) => _windDeg = windDeg;

  double? get windGust => _windGust;

  set windGust(double? windGust) => _windGust = windGust;

  List<Weather>? get weather => _weather;

  set weather(List<Weather>? weather) => _weather = weather;

  int? get clouds => _clouds;

  set clouds(int? clouds) => _clouds = clouds;

  int? get pop => _pop;

  set pop(int? pop) => _pop = pop;

  double? get uvi => _uvi;

  set uvi(double? uvi) => _uvi = uvi;

  Daily.fromJson(Map<String, dynamic> json) {
    _dt = json['dt'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _moonrise = json['moonrise'];
    _moonset = json['moonset'];
    _moonPhase = json['moon_phase'];
    _temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    _feelsLike = json['feels_like'] != null
        ? new FeelsLike.fromJson(json['feels_like'])
        : null;
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _dewPoint = json['dew_point'];
    _windSpeed = json['wind_speed'];
    _windDeg = json['wind_deg'];
    _windGust = json['wind_gust'];
    if (json['weather'] != null) {
      _weather = <Weather>[];
      json['weather'].forEach((v) {
        _weather!.add(new Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'];
    _pop = json['pop'];
    _uvi = json['uvi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this._dt;
    data['sunrise'] = this._sunrise;
    data['sunset'] = this._sunset;
    data['moonrise'] = this._moonrise;
    data['moonset'] = this._moonset;
    data['moon_phase'] = this._moonPhase;
    if (this._temp != null) {
      data['temp'] = this._temp!.toJson();
    }
    if (this._feelsLike != null) {
      data['feels_like'] = this._feelsLike!.toJson();
    }
    data['pressure'] = this._pressure;
    data['humidity'] = this._humidity;
    data['dew_point'] = this._dewPoint;
    data['wind_speed'] = this._windSpeed;
    data['wind_deg'] = this._windDeg;
    data['wind_gust'] = this._windGust;
    if (this._weather != null) {
      data['weather'] = this._weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = this._clouds;
    data['pop'] = this._pop;
    data['uvi'] = this._uvi;
    return data;
  }
}

class Temp {
  double? _day;
  double? _min;
  double? _max;
  double? _night;
  double? _eve;
  double? _morn;

  Temp(
      {double? day,
      double? min,
      double? max,
      double? night,
      double? eve,
      double? morn}) {
    if (day != null) {
      this._day = day;
    }
    if (min != null) {
      this._min = min;
    }
    if (max != null) {
      this._max = max;
    }
    if (night != null) {
      this._night = night;
    }
    if (eve != null) {
      this._eve = eve;
    }
    if (morn != null) {
      this._morn = morn;
    }
  }

  double? get day => _day;

  set day(double? day) => _day = day;

  double? get min => _min;

  set min(double? min) => _min = min;

  double? get max => _max;

  set max(double? max) => _max = max;

  double? get night => _night;

  set night(double? night) => _night = night;

  double? get eve => _eve;

  set eve(double? eve) => _eve = eve;

  double? get morn => _morn;

  set morn(double? morn) => _morn = morn;

  Temp.fromJson(Map<String, dynamic> json) {
    _day = json['day'];
    _min = json['min'];
    _max = json['max'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this._day;
    data['min'] = this._min;
    data['max'] = this._max;
    data['night'] = this._night;
    data['eve'] = this._eve;
    data['morn'] = this._morn;
    return data;
  }
}

class FeelsLike {
  double? _day;
  double? _night;
  double? _eve;
  double? _morn;

  FeelsLike({double? day, double? night, double? eve, double? morn}) {
    if (day != null) {
      this._day = day;
    }
    if (night != null) {
      this._night = night;
    }
    if (eve != null) {
      this._eve = eve;
    }
    if (morn != null) {
      this._morn = morn;
    }
  }

  double? get day => _day;

  set day(double? day) => _day = day;

  double? get night => _night;

  set night(double? night) => _night = night;

  double? get eve => _eve;

  set eve(double? eve) => _eve = eve;

  double? get morn => _morn;

  set morn(double? morn) => _morn = morn;

  FeelsLike.fromJson(Map<String, dynamic> json) {
    _day = json['day'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this._day;
    data['night'] = this._night;
    data['eve'] = this._eve;
    data['morn'] = this._morn;
    return data;
  }
}
