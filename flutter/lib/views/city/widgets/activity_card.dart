import 'package:flutter/material.dart';
import '../../../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isSelected;
  final Function toggleActivity;

  const ActivityCard({
    this.activity,
    this.isSelected,
    this.toggleActivity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              image: NetworkImage(activity.image),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: toggleActivity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        if (isSelected)
                          const Icon(
                            Icons.check,
                            size: 40,
                            color: Colors.white,
                          ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            activity.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
