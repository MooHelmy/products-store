import 'package:products/Models/Prodects_Model.dart';

import 'package:products/helper/Api_helper.dart';

class CategorryServices {
  Future<List<ProductModel>> getallcategory({required String category}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category');
    List<ProductModel> categoryList = [];
    for (int i = 0; i < data.length; i++) {
      categoryList.add(ProductModel.fromJson(data[i]));
    }

    return categoryList;
  }
}
