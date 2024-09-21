import 'package:weather_app/models/weathermodel.dart';

class Weatherstate {}

class Initialstate extends Weatherstate {}

class Weatherloadedstate extends Weatherstate {

  Weathermodel weathermodel;
 List<Weathermodel2> weathermodel2;
  Weatherloadedstate({required this.weathermodel,required this.weathermodel2});
}
class Weatherloadingstate extends Weatherstate {

}



class Weatherfaliurestate extends Weatherstate {}
