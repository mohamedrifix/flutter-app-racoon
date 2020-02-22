import 'package:flutter/material.dart';
import 'package:projet_dyma_end/providers/city_provider.dart';
import 'package:projet_dyma_end/providers/trip_provider.dart';
import 'package:projet_dyma_end/views/trip/trip_view.dart';
import 'package:provider/provider.dart';

import './views/city/city_view.dart';
import './views/home/home_view.dart';
import './views/not-found/not_found.dart';
import './views/trips/trips_view.dart';

main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatefulWidget {
  @override
  _DymaTripState createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  final CityProvider cityProvider = CityProvider();
  final TripProvider tripProvider = TripProvider();

  @override
  void initState() {
    cityProvider.fetchData();
    tripProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: cityProvider),
        ChangeNotifierProvider.value(value: tripProvider),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => HomeView(),
          CityView.routeName: (_) => CityView(),
          TripsView.routeName: (_) => TripsView(),
          TripView.routeName: (_) => TripView()
        },
        onUnknownRoute: (_) => MaterialPageRoute(
          builder: (_) => NotFound(),
        ),
      ),
    );
  }
}
