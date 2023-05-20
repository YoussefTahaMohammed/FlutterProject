import 'package:assignment1/main.dart';
import 'package:assignment1/modules/service/Functions.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String serviceDescription;
  final int isFavourite;
  final int id;

  const ServiceCard({
    Key? key,
    required this.id,
    required this.serviceName,
    required this.serviceDescription,
    required this.isFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(119, 117, 245, 0.2),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: const TextStyle(
                      fontSize: 25,
                      wordSpacing: 7,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    serviceDescription,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            StarButton(
              valueChanged: (isStared) {
                if(isStared){
                  if(sharedPref.getString("favoriteServices")=="null"||
                      sharedPref.getString("favoriteServices")==""){
                      addFavorite(context,"$id,");
                      sharedPref.setString("favoriteServices", "$id,");
                  }
                  else{
                    sharedPref.setString("favoriteServices", "${sharedPref.getString("favoriteServices")}$id,");
                    addFavorite(context, sharedPref.getString("favoriteServices"));
                  }
                }
                else{
                  List<String> list =sharedPref.getString("favoriteServices").toString().split(",");
                  list.removeWhere((element) => element == "$id");
                  String out =list.toString();
                  out = out.replaceAll("[", "");
                  out = out.replaceAll("]", "");
                  out = out.replaceAll(" ", "");
                  sharedPref.setString("favoriteServices", out);
                  addFavorite(context, sharedPref.getString("favoriteServices"));
                }
              },
              isStarred: sharedPref.getString("favoriteServices").toString().contains(id.toString())  ? true: false,
              iconColor: const Color.fromRGBO(255, 149, 41, 1),
            ),
          ],
        ),
      ),
    );
  }
}
