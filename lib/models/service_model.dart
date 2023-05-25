class ServiceModel {
  final int id;
  final String serviceName;
  final String serviceDescription;
  final int companyId;
  final String companyName;

  ServiceModel({
    required this.id,
    required this.serviceName,
    required this.serviceDescription,
    required this.companyId,
    required this.companyName,
  });
  factory ServiceModel.fromJson(Map<String,dynamic>json)=>ServiceModel(
      id:json["serviceid"],
      serviceName: json["servicename"],
      serviceDescription: json["servicedescription"],
      companyId: json["companyid"],
      companyName: json["companyname"]??""
  );
}