import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projet_dyma_end/widgets/dyma_loader.dart';

class TripWeather extends StatelessWidget {
  final String cityName;
  final String hostBase = 'https://api.openweathermap.org/data/2.5/weather?q=';
  final String apiKey = '&appid=f5dd5d8df05953a6da3b3676bf708ee0';

  TripWeather({this.cityName});

  String get query => '$hostBase$cityName$apiKey';

  Future<String> get getWeather {
    return http.get(query).then((http.Response response) {
      Map<String, dynamic> body = json.decode(response.body);
      return body['weather'][0]['icon'] as String;
    }).catchError((e) => 'error');
  }

  String getIconUrl(String iconName) {
    return 'https://openweathermap.org/img/wn/$iconName@2x.png';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Text('error');
        } else if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Meteo',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  getIconUrl(snapshot.data),
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          );
        } else {
          return DymaLoader();
        }
      },
    );
  }
}
