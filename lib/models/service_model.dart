class ServiceModel {
  final int id;
  final String serviceName;
  final String serviceDescription;
  final int companyId;

  ServiceModel({
    required this.id,
    required this.serviceName,
    required this.serviceDescription,
    required this.companyId,
  });
  factory ServiceModel.fromJson(Map<String,dynamic>json)=>ServiceModel(
      id:json["serviceid"],
      serviceName: json["servicename"],
      serviceDescription: json["servicedescription"],
      companyId: json["companyid"]
  );
}