import 'package:products/Models/Prodects_Model.dart';
import 'package:products/helper/Api_helper.dart';

class addproduct {
  Future<ProductModel> post(
      {required String titel,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': titel,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );

    return ProductModel.fromJson(data);
  }
}
