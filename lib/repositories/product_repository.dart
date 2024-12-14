import 'dart:convert';

import '../models/product_list_model.dart';
import '../utils/api_end_points.dart';
import '../utils/enums.dart';
import '../utils/helper/api_helper.dart';

class ProductRepository with ApiHelper {
  Future<List<AllProduct>?> fetchAllProducts({bool showToast = false}) async {
    try {
      final response = await request(
        type: RequestType.get,
        endpoint: allProductsEndPoint,
        showToast: showToast,
      );
      return allProductFromMap(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
