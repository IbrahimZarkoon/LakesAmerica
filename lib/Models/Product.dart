class Product {
  final String image;
  final String title;
  final String category;
  final String price;
  final String discountPrice;
  final String discountAmount;
  final bool newArrival;

  Product({required this.image, required this.title, required this.category, required this.price, required this.discountAmount, required  this.discountPrice, required  this.newArrival});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      newArrival : json['newArrival'] as bool,
      discountPrice : json['discountPrice'] as String,
      discountAmount : json['discountAmount'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      price: json['price'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'newArrival': newArrival,
      'discountPrice': discountPrice,
      'discountAmount': discountAmount,
      'image': image,
      'title': title,
      'category': category,
      'price': price,
    };
  }
}