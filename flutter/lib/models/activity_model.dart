import 'package:flutter/foundation.dart';

enum ActivityStatus { ongoing, done }

class Activity {
  String id;
  String name;
  String image;
  String city;
  double price;
  ActivityStatus status;
  Activity({
    @required this.name,
    @required this.city,
    @required this.id,
    @required this.image,
    @required this.price,
    this.status = ActivityStatus.ongoing,
  });

  Activity.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        image = json['image'],
        city = json['city'],
        price = json['price'].toDouble(),
        status =
            json['status'] == 0 ? ActivityStatus.ongoing : ActivityStatus.done;

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'city': city,
      'price': price,
      'status': status == ActivityStatus.ongoing ? 0 : 1
    };
  }
}
