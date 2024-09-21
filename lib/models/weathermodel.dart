class Weathermodel {
  final String cityname;
  final String imagepath;
  final DateTime date;
  final String? state;
  final double avgtemp;
  final double mintemp;
  final double maxtemp;

  Weathermodel({
    required this.cityname,
    required this.imagepath,
    required this.date,
    required this.avgtemp,
    required this.maxtemp,
    required this.mintemp,
    required this.state,
  });
  factory Weathermodel.fromjson(json) {
    return Weathermodel(
      cityname: json['location']['name'],
      imagepath: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      date: DateTime.parse(json['current']['last_updated']),
      avgtemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      state: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}

class Weathermodel2 {
  final String day;
  final String imageurl;
  final double mintemp2;
  final double maxtemp2;

  Weathermodel2({
    required this.day,
    required this.imageurl,
    required this.maxtemp2,
    required this.mintemp2,
  });
  factory Weathermodel2.fromjson(json) {
    return Weathermodel2(
      day: json['date'],
      imageurl: json['day']['condition']['icon'],
      maxtemp2: json['day']['maxtemp_c'],
      mintemp2: json['day']['mintemp_c'],
    );
  }
}
