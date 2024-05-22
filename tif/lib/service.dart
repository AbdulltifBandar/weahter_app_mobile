import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model.dart';
String Cityname='mixco';

class ChangeName {
  changename(String newname) {
    Cityname = newname;
    print(Cityname);
    print("entered in");
    weatherfetch();
    print("entered out");
  }
}


  var url = 'https://api.openweathermap.org/data/2.5/weather?q=${Cityname}&appid=58bab8545dac674206d75afa3a0c172e';

Future <Weazer> weatherfetch()  async {
  http.Response response = await http.get(Uri.parse(url));
  var body = await jsonDecode(response.body);
  print ("the city nameis: "+Cityname);
  print("ayooooooo");
  return  Weazer.fromJson(body);

  }

