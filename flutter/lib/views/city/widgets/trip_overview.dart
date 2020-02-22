import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip_model.dart';

class TripOverview extends StatelessWidget {
  final Function setDate;
  final Trip trip;
  final String cityName;
  final double amount;

  const TripOverview({
    this.setDate,
    this.trip,
    this.cityName,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  trip.date != null
                      ? DateFormat("d/M/y").format(trip.date)
                      : 'Choisissez une date',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              RaisedButton(
                child: const Text('Selectioner une date'),
                onPressed: setDate,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              const Expanded(
                child: const Text(
                  'Montant / personne',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Text(
                '$amount \$',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
