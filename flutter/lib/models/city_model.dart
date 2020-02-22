import 'package:flutter/foundation.dart';

import './activity_model.dart';

class City {
  String id;
  String image;
  String name;
  List<Activity> activities;
  City(
      {@required this.image,
      @required this.name,
      @required this.activities,
      @required this.id});

  City.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        image = json['image'],
        name = json['name'],
        activities = (json['activities'] as List)
            .map(
              (activityJson) => Activity.fromJson(activityJson),
            )
            .toList();
}
