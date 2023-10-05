import 'package:products/helper/Api_helper.dart';

class Allcategores {
  Future<List<dynamic>> getallcategores() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
