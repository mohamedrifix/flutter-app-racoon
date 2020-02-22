import 'package:flutter/material.dart';
import 'package:projet_dyma_end/models/activity_model.dart';
import 'package:projet_dyma_end/models/trip_model.dart';
import 'package:projet_dyma_end/providers/trip_provider.dart';
import 'package:provider/provider.dart';

class TripActivityList extends StatelessWidget {
  final String tripId;
  final ActivityStatus filter;

  TripActivityList({this.tripId, this.filter});

  @override
  Widget build(BuildContext context) {
    return Consumer<TripProvider>(
      builder: (context, tripProvider, child) {
        final Trip trip = Provider.of<TripProvider>(context).getById(tripId);
        final List<Activity> activities = trip.activities
            .where((activity) => activity.status == filter)
            .toList();
        return ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, i) {
            Activity activity = activities[i];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: filter == ActivityStatus.ongoing
                  ? Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.greenAccent[700],
                        ),
                      ),
                      key: ValueKey(activity.id),
                      child: Card(
                        child: ListTile(
                          title: Text(activity.name),
                        ),
                      ),
                      confirmDismiss: (_) {
                        return Provider.of<TripProvider>(context, listen: false)
                            .updateTrip(trip, activity.id)
                            .then((_) => true)
                            .catchError((_) => false);
                      },
                    )
                  : Card(
                      child: ListTile(
                        title: Text(
                          activity.name,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
            );
          },
        );
      },
      child: Text('123'),
    );
  }
}
