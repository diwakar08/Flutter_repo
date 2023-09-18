class Product {
  String productID;
  String productName;
  String category;
  List<String> image;
  String description;
  String quantityType;
  double mrpPrice;
  double offerPrice;
  String productType;
  ReturnReplacement returnReplacement;
  String sellerID;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.productID,
    required this.productName,
    required this.category,
    required this.image,
    required this.description,
    required this.quantityType,
    required this.mrpPrice,
    required this.offerPrice,
    required this.productType,
    required this.returnReplacement,
    required this.sellerID,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productID: json['productID'],
      productName: json['productName'],
      category: json['category'],
      image: List<String>.from(json['image']),
      description: json['description'],
      quantityType: json['quantityType'],
      mrpPrice: json['mrpPrice'].toDouble(),
      offerPrice: json['offerPrice'].toDouble(),
      productType: json['productType'],
      returnReplacement: ReturnReplacement.fromJson(json['returnReplacement']),
      sellerID: json['sellerID'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}


class ReturnReplacement {
  bool returnStatus;
  bool replacementStatus;
  int returnPeriod;
  int replacementPeriod;

  ReturnReplacement({
    required this.returnStatus,
    required this.replacementStatus,
    required this.returnPeriod,
    required this.replacementPeriod,
  });

  factory ReturnReplacement.fromJson(Map<String, dynamic> json) {
    return ReturnReplacement(
      returnStatus: json['return']['type'],
      replacementStatus: json['replacement']['type'],
      returnPeriod: json['return']['returnPeriod'],
      replacementPeriod: json['replacement']['replacementPeriod'],
    );
  }
}
