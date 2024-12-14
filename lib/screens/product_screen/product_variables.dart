import 'package:provider_base/repositories/product_repository.dart';

import '../../models/product_list_model.dart';

mixin ProductVariables{

  ProductRepository productRepository = ProductRepository();

  List<AllProduct> allProducts = [];
  bool isLoading = false;
  bool isError = false;

  List<AllProduct> cartList = [];

}