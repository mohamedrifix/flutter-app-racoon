import 'package:flutter/material.dart';
import 'package:projet_dyma_end/providers/city_provider.dart';
import 'package:projet_dyma_end/widgets/dyma_loader.dart';
import 'package:provider/provider.dart';
import './widgets/city_card.dart';
import '../../widgets/dyma_drawer.dart';
import '../../models/city_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;
    return Scaffold(
      appBar: AppBar(
        title: const Text('dymatrip'),
      ),
      drawer: const DymaDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: RefreshIndicator(
          onRefresh: Provider.of<CityProvider>(context).fetchData,
          child: cities.length > 0
              ? ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (_, i) => CityCard(
                    city: cities[i],
                  ),
                )
              : DymaLoader(),
        ),
      ),
    );
  }
}
