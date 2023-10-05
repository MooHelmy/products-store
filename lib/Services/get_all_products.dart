import 'package:products/Models/Prodects_Model.dart';
import 'package:products/helper/Api_helper.dart';

class AllProudctServices {
  Future<List<ProductModel>> getallproduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productList = [];
    for (var map in data) {
      productList.add(
        ProductModel.fromJson(map),
      );
    }

    return productList;
  }
}
