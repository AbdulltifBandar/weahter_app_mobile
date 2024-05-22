
class Weazer {
  final double temp ;
  final String Name;
  final String statuse;
  final int time;
  final String weathertype;

  Weazer({required this.Name,required this.statuse, required this.temp, required this.time,required this.weathertype});


  factory Weazer.fromJson(Map<String , dynamic>map){
    return Weazer(
            Name: map['name'],
            statuse: map['weather'][0]['icon'],
            temp: map['main']['temp'],
            time: map['dt'],
            weathertype: map['weather'][0]['main']

    );
  }

}