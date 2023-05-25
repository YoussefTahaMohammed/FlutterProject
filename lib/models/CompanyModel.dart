class CompanyModel {
  String companyName;
  String companySize;
  String companyAddress;
  String companyIndustry;
  String contactPersonName;
  int companyServicesCount;
  int companyId;
  double lat;
  double lng;

  CompanyModel({
    required this.companyName,
    required this.companyServicesCount,
    required this.companySize,
    required this.companyAddress,
    required this.companyIndustry,
    required this.companyId,
    required this.contactPersonName,
    required this.lat,
    required this.lng,
  });

  factory CompanyModel.fromJson(Map<String,dynamic>json)=>CompanyModel(
      companyName: json["companyname"]??"",
      companyServicesCount: json["number"]?? 0,
      companyAddress: json["companyaddress"]??"",
      companyIndustry: json["companyindustry"]??"",
      companySize: json["companysize"]??"",
      companyId: json["id"]??0,
      contactPersonName: json["contactpersonname"]??"",
      lat:json["lat"] ?? 0,
      lng:json["lng"] ?? 0,

  );
}