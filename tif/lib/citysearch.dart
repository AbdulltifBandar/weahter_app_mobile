import 'package:flutter/material.dart';
import 'service.dart';
import 'ui.dart';
class citysearch extends StatefulWidget {
  const citysearch({Key? key}) : super(key: key);

  @override
  State<citysearch> createState() => _citysearchState();
}

class _citysearchState extends State<citysearch> {
  @override
  Widget build(BuildContext context) {
    const List<String> cities = [
      'London',
      'Tokyo',
      'New York City',
      'Paris',
      'Dubai',
      'Mumbai',
      'São Paulo',
      'Berlin',
      'Madrid',
      'Rome',
      'Singapore',
      'Mexico City',
      'Istanbul',
      'Toronto',
      'Sydney',
      'Rio de Janeiro',
      'Los Angeles',
      'Buenos Aires',
      'Chicago',
      'Beijing',
      'Seoul',
      'Cairo',
      'Cape Town',
      'Moscow',
      'Johannesburg'
    ];

    return Scaffold(
      appBar: AppBar(title: Text("cities list")),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: cities.length,
              prototypeItem: ListTile(
                title: Text(cities.first),
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                   setState(() {
                     ChangeName().changename(cities[index]);
                     weatherfetch();
                     Navigator.pop(context,'/ui');
                   });
                  },
                  title: Text(cities[index]),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}