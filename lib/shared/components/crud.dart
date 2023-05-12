import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';
class Crud{
  getRequest(String url) async{
    try{
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }
      else {
        print("Error${response.statusCode}");
      }
    }catch(e){
      print("Error Catch $e");
    }
  }
  postRequest(String url,Map data) async{
    try{
      var response = await http.post(Uri.parse(url),body: data);
      if(response.statusCode == 200){
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }
      else {
        print("Error ${response.statusCode}");
      }
    }catch(e){
      print("Error Catch $e");
    }
  }
  postRequestWithImage(String url,Map data,File file) async{
    try{
      var request = http.MultipartRequest("POST", Uri.parse(url));
      var len = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multiPartFile = http.MultipartFile("image",stream,len,filename:basename(file.path) );
      request.files.add(multiPartFile);
      request.fields['id'] = data['id'];
      var myRequest = await request.send();
      var response = await http.Response.fromStream(myRequest);
      if(myRequest.statusCode == 200 ){
        return jsonDecode(response.body);
      }
      else{
        print("Error${myRequest.statusCode}");
      }
    }catch(e){
      print("Error Catch: $e");
    }

  }
}