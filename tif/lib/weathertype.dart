import 'package:flutter/cupertino.dart';

import'ui.dart';
import 'package:lottie/lottie.dart';
  tyoeofweather (String type )async{
  var typo = await type;
    switch (typo) {
      case 'Clear':
        {
        return Lottie.asset("asset/lottise/Clear.json");

        }
      case 'Rain':
        {
          return Lottie.asset("asset/lottise/Rain_am.json");


        }
      case 'Snow':
        {
          return Lottie.asset("asset/lottise/Snow.json");

        }
      case 'Clouds':
        {

          return Lottie.asset ("asset/lottise/Cloads.json");

        }
      case 'Fog':
        {
          return Lottie.asset("asset/lottise/fog.json");

        }
       default:{
        return Lottie.asset("asset/lottise/Clear.json");
    }
  }
  }

