class ListOfCompanies {
  final List<dynamic> companies;

  ListOfCompanies({
    required this.companies
  });

  factory ListOfCompanies.fromJson(Map<String,dynamic>jsonData){
    return ListOfCompanies(
      companies: jsonData['data']
    );
  }
}