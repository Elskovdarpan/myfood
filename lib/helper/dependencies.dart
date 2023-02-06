

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myfood/controller/popular_product_controller.dart';
import 'package:myfood/data/api/api_client.dart';
import 'package:myfood/data/repository/popular_product_repo.dart';

Future<void> init()async{
  Get.lazyPut(()=>ApiClient(appBaseUrl: "hkjhjk"));

  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
}