import 'package:products/Models/Prodects_Model.dart';
import 'package:products/helper/Api_helper.dart';

class UpdateproudctServices {
  update(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': price,
      'image': image,
      'category': category,
    });
    print(data);
    return ProductModel.fromJson(data);
  }
}
