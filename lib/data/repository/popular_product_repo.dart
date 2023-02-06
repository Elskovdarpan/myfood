

import 'package:get/get.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetConnect implements GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData("end point url");
  }
}