import 'package:weather_app/features/weather/domain/entity/current_city_entity.dart';

/// coord : {"lon":-122.08,"lat":37.39}
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]
/// base : "stations"
/// main : {"temp":282.55,"feels_like":281.86,"temp_min":280.37,"temp_max":284.26,"pressure":1023,"humidity":100}
/// visibility : 10000
/// wind : {"speed":1.5,"deg":350}
/// clouds : {"all":1}
/// dt : 1560350645
/// sys : {"type":1,"id":5122,"message":0.0139,"country":"US","sunrise":1560343627,"sunset":1560396563}
/// timezone : -25200
/// id : 420006353
/// name : "Mountain View"
/// cod : 200

class CurrentCityModel extends CurrentCityEntity {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentCityModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod})
      : super(
            coord: coord,
            weather: weather,
            base: base,
            main: main,
            visibility: visibility,
            wind: wind,
            clouds: clouds,
            dt: dt,
            sys: sys,
            timezone: timezone,
            id: id,
            name: name,
            cod: cod);

  factory CurrentCityModel.fromJson(dynamic json) {
    List<Weather> weather = [];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    return CurrentCityModel(
        coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
        weather: weather,
        base: json['base'],
        main: json['main'] != null ? Main.fromJson(json['main']) : null,
        visibility: json['visibility'],
        wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
        clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
        dt: json['dt'],
        sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
        timezone: json['timezone'],
        id: json['id'],
        name: json['name'],
        cod: json['cod']);
  }
}

/// type : 1
/// id : 5122
/// message : 0.0139
/// country : "US"
/// sunrise : 1560343627
/// sunset : 1560396563

class Sys {
  Sys({
    int? type,
    int? id,
    double? message,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    _type = type;
    _id = id;
    _message = message;
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
  }

  Sys.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _message = json['message'];
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  int? _type;
  int? _id;
  double? _message;
  String? _country;
  int? _sunrise;
  int? _sunset;

  Sys copyWith({
    int? type,
    int? id,
    double? message,
    String? country,
    int? sunrise,
    int? sunset,
  }) =>
      Sys(
        type: type ?? _type,
        id: id ?? _id,
        message: message ?? _message,
        country: country ?? _country,
        sunrise: sunrise ?? _sunrise,
        sunset: sunset ?? _sunset,
      );

  int? get type => _type;

  int? get id => _id;

  double? get message => _message;

  String? get country => _country;

  int? get sunrise => _sunrise;

  int? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    map['message'] = _message;
    map['country'] = _country;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }
}

/// all : 1

class Clouds {
  Clouds({
    int? all,
  }) {
    _all = all;
  }

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }

  int? _all;

  Clouds copyWith({
    int? all,
  }) =>
      Clouds(
        all: all ?? _all,
      );

  int? get all => _all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }
}

/// speed : 1.5
/// deg : 350

class Wind {
  Wind({
    double? speed,
    int? deg,
  }) {
    _speed = speed;
    _deg = deg;
  }

  Wind.fromJson(dynamic json) {
    _speed = json['speed'];
    _deg = json['deg'];
  }

  double? _speed;
  int? _deg;

  Wind copyWith({
    double? speed,
    int? deg,
  }) =>
      Wind(
        speed: speed ?? _speed,
        deg: deg ?? _deg,
      );

  double? get speed => _speed;

  int? get deg => _deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = _speed;
    map['deg'] = _deg;
    return map;
  }
}

/// temp : 282.55
/// feels_like : 281.86
/// temp_min : 280.37
/// temp_max : 284.26
/// pressure : 1023
/// humidity : 100

class Main {
  Main({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) {
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _humidity = humidity;
  }

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
  }

  double? _temp;
  double? _feelsLike;
  double? _tempMin;
  double? _tempMax;
  int? _pressure;
  int? _humidity;

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) =>
      Main(
        temp: temp ?? _temp,
        feelsLike: feelsLike ?? _feelsLike,
        tempMin: tempMin ?? _tempMin,
        tempMax: tempMax ?? _tempMax,
        pressure: pressure ?? _pressure,
        humidity: humidity ?? _humidity,
      );

  double? get temp => _temp;

  double? get feelsLike => _feelsLike;

  double? get tempMin => _tempMin;

  double? get tempMax => _tempMax;

  int? get pressure => _pressure;

  int? get humidity => _humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    return map;
  }
}

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01d"

class Weather {
  Weather({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
  }

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      Weather(
        id: id ?? _id,
        main: main ?? _main,
        description: description ?? _description,
        icon: icon ?? _icon,
      );

  int? get id => _id;

  String? get main => _main;

  String? get description => _description;

  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }
}

/// lon : -122.08
/// lat : 37.39

class Coord {
  Coord({
    double? lon,
    double? lat,
  }) {
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }

  double? _lon;
  double? _lat;

  Coord copyWith({
    double? lon,
    double? lat,
  }) =>
      Coord(
        lon: lon ?? _lon,
        lat: lat ?? _lat,
      );

  double? get lon => _lon;

  double? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }
}
