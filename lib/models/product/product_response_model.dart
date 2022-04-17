class ProductReponseModel {
  int? statusCode;
  bool? status;
  List<Products>? products;

  ProductReponseModel({this.statusCode, this.status, this.products});

  ProductReponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  String? title;
  String? brand;
  int? categoryId;
  String? description;
  List<String>? keywords;
  int? price;
  int? quantity;
  String? image;
  String? currencyId;
  String? createdAt;
  List<Category>? category;
  List<Currency>? currency;

  Products(
      {this.sId,
      this.title,
      this.brand,
      this.categoryId,
      this.description,
      this.keywords,
      this.price,
      this.quantity,
      this.image,
      this.currencyId,
      this.createdAt,
      this.category,
      this.currency});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'];
    categoryId = json['categoryId'];
    description = json['description'];
    keywords = json['keywords'].cast<String>();
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    currencyId = json['currencyId'];
    createdAt = json['createdAt'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['currency'] != null) {
      currency = <Currency>[];
      json['currency'].forEach((v) {
        currency!.add(new Currency.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['brand'] = this.brand;
    data['categoryId'] = this.categoryId;
    data['description'] = this.description;
    data['keywords'] = this.keywords;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['currencyId'] = this.currencyId;
    data['createdAt'] = this.createdAt;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.currency != null) {
      data['currency'] = this.currency!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? iId;
  String? categoryName;

  Category({this.iId, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['categoryName'] = this.categoryName;
    return data;
  }
}

class Currency {
  String? sId;
  String? currency;
  String? symbol;

  Currency({this.sId, this.currency, this.symbol});

  Currency.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    currency = json['currency'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['currency'] = this.currency;
    data['symbol'] = this.symbol;
    return data;
  }
}
