import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:get/get.dart';

class LoginRepository extends GetxController{
  NetworkApiServices networkApiServices = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data)async{
    dynamic response = await networkApiServices.postApiResponse(AppApiUrl.loginUrl, data);
    return response;
  }

}