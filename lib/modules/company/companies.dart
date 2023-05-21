import 'package:assignment1/models/CompanyModel.dart';
import 'package:assignment1/modules/company/Functions.dart';
import 'package:assignment1/modules/company/company_card.dart';
import 'package:flutter/material.dart';
class Companies extends StatefulWidget {
  const Companies({Key? key}) : super(key: key);

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies>{

  List<CompanyModel> foundCompanies = [];
  @override
  void initState() {
    //foundCompanies = companies;
    super.initState();
  }

  // void searchCompanyName(String searchedCompany){
  //   List<CompanyModel> result = [];
  //   if(searchedCompany.isEmpty){
  //     result = companies;
  //   }
  //   else{
  //     result = companies.where((element) => element.companyName.toLowerCase().contains(searchedCompany.toLowerCase())).toList();
  //   }
  //   setState(() {
  //     foundCompanies = result;
  //   });
  // }
  // void searchCompanyServices(String searchedCompany){
  //   List<CompanyModel> result = [];
  //   if(searchedCompany.isEmpty){
  //     result = companies;
  //   }
  //   else{
  //     result = companies.where((element) => element.companyServices.toLowerCase().contains(searchedCompany.toLowerCase())).toList();
  //   }
  //   setState(() {
  //     foundCompanies = result;
  //   });
  // }
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          "Companies ",
        ),
        backgroundColor:const Color.fromRGBO(119, 117, 245, 1) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child:Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children:[
                  FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      if(snapshot.data["status"]=="failed"){
                        return const Center(child: Text("There is No Companies"));
                      }
                      return ListView.separated(itemBuilder: (context,i){
                        return
                          CompanyCard(
                              companyName: snapshot.data['data'][i]['companyname'],
                              companyServices: "Number of Services: ${snapshot.data['data'][i]['number']}",
                              id: snapshot.data['data'][i]['id'],

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
                    return const Center(child: Text("No Companies Available...."));
                  },
                    future: getCompanies(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

