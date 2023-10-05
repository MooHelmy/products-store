class ProductModel {
  final int id;
  final String title;
  final price;
  final String descriptions;
  final String image;
  final String category;
  final RatingModel? rate;
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.descriptions,
      required this.image,
      required this.category,
      required this.rate});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      descriptions: jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'],
      rate: jsonData['rating'] == null
          ? null
          : RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
