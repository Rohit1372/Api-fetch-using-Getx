import 'dart:developer';
import 'package:app/model/products.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class Controller extends GetxController {
  var listOfProducts = <Products>[].obs;
  var isloading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isloading(true);
      var products = await Services.fetchProducts();
      if (products != null) {
        listOfProducts.assignAll(products);
      }
    } finally {
      isloading(false);
    }
  }
}
