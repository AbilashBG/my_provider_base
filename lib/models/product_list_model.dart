import 'dart:convert';

List<AllProduct> allProductFromMap(String str) =>
    List<AllProduct>.from(json.decode(str).map((x) => AllProduct.fromMap(x)));

String allProductToMap(List<AllProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AllProduct {
  String? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  bool isAddedToCart;

  AllProduct({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.isAddedToCart = false,
  });

  factory AllProduct.fromMap(Map<String, dynamic> json) => AllProduct(
        id: json["id"]?.toString(),
        title: json["title"]?.toString(),
        price: json["price"]?.toString(),
        description: json["description"]?.toString(),
        category: json["category"]?.toString(),
        image: json["image"]?.toString(),
        rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toMap(),
      };
}

class Rating {
  String? rate;
  String? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toString(),
        count: json["count"]?.toString(),
      );

  Map<String, dynamic> toMap() => {
        "rate": rate,
        "count": count,
      };
}
