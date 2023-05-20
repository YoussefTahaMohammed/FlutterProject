import 'package:assignment1/modules/service/Functions.dart';
import 'package:assignment1/modules/service/service_card.dart';
import 'package:flutter/material.dart';

class AllServices extends StatefulWidget {
  const AllServices({Key? key}) : super(key: key);

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children:[
              FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  if(snapshot.data["status"]=="failed"){
                    return const Center(child: Text("There is No Services"));
                  }
                  return ListView.separated(itemBuilder: (context,i){
                    return
                      ServiceCard(
                          serviceName: snapshot.data['data'][i]['servicename'],
                          serviceDescription: snapshot.data['data'][i]['servicedescription'],
                          id: snapshot.data['data'][i]['serviceid'],
                      );
                  },
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder:(context,index)=> const SizedBox(height:15,),
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: Text("Loading...."));
                }
                return const Center(child: Text("No Available Services"));
              },
                future: getServices(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
