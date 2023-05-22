import 'package:assignment1/models/CompanyModel.dart';
import 'package:assignment1/shared/colors.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  CompanyScreen({super.key, required this.companyModel});
  final CompanyModel companyModel;
  final List<String> companyServices = [
    "Industry name 1",
    "Industry name 2",
    "Industry name 3",
    "Industry name 4",
    "Industry name 5"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar(
            name: 'Company Profile',
            list: [],
            function: () {
              Navigator.of(context).pop();
            }),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/loc.png',
                  width: double.infinity,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 140),
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 7), // changes position of shadow
                            ),
                          ],
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3.0,
                              color: Colors.white54,
                              strokeAlign: BorderSide.strokeAlignOutside),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/fsfs.png'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Company Name",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Company Industry",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.info,
                    color: defaultColor,
                  ),
                  child: Text(
                    "About",
                    style: TextStyle(color: defaultColor),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.miscellaneous_services,
                    color: defaultColor,
                  ),
                  child: Text(
                    "Services",
                    style: TextStyle(color: defaultColor),
                  ),
                ),
              ],
            ),
              Expanded(
              child:  TabBarView(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Owner : ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Youssef Mohamed",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Size : ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "nano",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Address : ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Fasil el 20 St",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Industries of Our Company :',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: companyServices.map((service) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              size: 12.0,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(width: 8.0),
                                            Text(
                                              service,
                                              style: const TextStyle(fontSize: 20.0),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         children: [
                           // Expanded(
                           //   child: ListView(
                           //     physics: const BouncingScrollPhysics(),
                           //     children:[
                           //       FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot){
                           //         if(snapshot.hasData){
                           //           if(snapshot.data["status"]=="failed"){
                           //             return const Center(child: Text("There is No Services"));
                           //           }
                           //           return ListView.separated(itemBuilder: (context,i){
                           //             return
                           //               ServiceCard(
                           //                 serviceName: snapshot.data['data'][i]['servicename'],
                           //                 serviceDescription: snapshot.data['data'][i]['servicedescription'],
                           //                 id: snapshot.data['data'][i]['serviceid'],
                           //               );
                           //           },
                           //             physics: const BouncingScrollPhysics(),
                           //             separatorBuilder:(context,index)=> const SizedBox(height:15,),
                           //             itemCount: snapshot.data['data'].length,
                           //             shrinkWrap: true,
                           //           );
                           //         }
                           //         if(snapshot.connectionState == ConnectionState.waiting){
                           //           return const Center(child: Text("Loading...."));
                           //         }
                           //         return const Center(child: Text("No Available Services"));
                           //       },
                           //         future: getServicesForCompany("11"),
                           //       )
                           //     ],
                           //   ),
                           // ),
                         ],
                       ),
                     ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
