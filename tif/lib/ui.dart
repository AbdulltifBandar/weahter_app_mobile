import 'package:flutter/material.dart';
import 'package:weatherapp/model.dart';
import 'package:weatherapp/service.dart';
import 'package:intl/intl.dart';
import 'citysearch.dart';
import 'weathertype.dart';
import 'package:lottie/lottie.dart';

class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  late Future<Weazer> W;
  bool _searchboolean = false;

  @override
  void initState() {
    super.initState();
    W = weatherfetch();
  }

  @override
  Widget build(BuildContext context) {
    late Future<Weazer> W;
    bool _searchboolean = false;

    @override
    void initState() {
      super.initState();
      W = weatherfetch();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => citysearch()),
                  );
                });
              },
              icon: Icon(Icons.search))
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<Weazer>(
          future: weatherfetch(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var temprture = snapshot.data!.temp - 273.15;
              var datetime = DateTime.fromMillisecondsSinceEpoch(
                  (snapshot.data!.time) * 1000,
                  isUtc: false);
              var datetime1 = DateFormat("yyyy-MM-dd HH:ss a").format(datetime);
              var dayname = DateFormat("EEEE").format(datetime);
              print("done");
              String icon_url = "http://openweathermap.org/img/w/" +
                  snapshot.data!.statuse.toString() +
                  ".png";
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 25,
                  ),
                  Center(
                      child: Text(
                    snapshot.data!.Name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w900),
                  )),
                  const SizedBox(
                    height: 64,
                  ),
                  Image(
                    image: NetworkImage(
                      icon_url,
                    ),
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    temprture.round().toString() + '°C',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Text(
                    snapshot.data!.weathertype,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    dayname,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                  Text(datetime1.toString())
                ],
              );
            } else
              return Center(child: const CircularProgressIndicator());
          }),
    );
  }
}
