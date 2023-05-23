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
      child: Positioned(
          top: 0,
          bottom: 660,
          right: 0,
          left: 0,
          child: Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin:  const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    color: Colors.white,
                    child: ListTile(
                      dense: true,
                      horizontalTitleGap: 0,
                      leading: Icon(
                        Icons.access_time_filled_outlined,
                        color:defaultColor,
                        size: 26,
                      ),
                      title: Text(
                        '$time  $type',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    color: Colors.white,
                    child: ListTile(
                      dense: true,
                      horizontalTitleGap: 0,
                      leading: Icon(
                        Icons.directions_car,
                        color:defaultColor,
                        size: 27,
                      ),
                      title: Text(
                        '$distance Km',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}