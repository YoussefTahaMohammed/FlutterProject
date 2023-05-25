import 'package:assignment1/shared/colors.dart';
import 'package:flutter/material.dart';


class DistanceAndTime extends StatelessWidget {
  final String time;
  final String distance;
  final bool isVisible;
  final String type;

  const DistanceAndTime(
      {super.key,
        required this.time,
        required this.distance,
        required this.isVisible,
        required this.type
      });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0,left: 60),
        child: Row(
          children: [
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child:Row(
                children: [
                  Icon(
                    Icons.access_time_filled_outlined,
                    color:defaultColor,
                    size: 26,
                  ),
                  Text(
                    '$time  $type',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,

              child: Row(
                children: [
                  Icon(
                    Icons.directions_car,
                    color:defaultColor,
                    size: 27,
                  ),
                  Text(
                    '$distance Km',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}