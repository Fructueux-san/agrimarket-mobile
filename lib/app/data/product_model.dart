class ProductModel {
  String? sId;
  String? name;
  int? price;
  String? picture;
  String? description;
  String? farmerId;
  List<String>? categories;
  String? createdAt;
  int? iV;

  ProductModel(
      {this.sId,
      this.name,
      this.price,
      this.picture,
      this.description,
      this.farmerId,
      this.categories,
      this.createdAt,
      this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    picture = json['picture'];
    description = json['description'];
    farmerId = json['farmerId'];
    categories = json['categories'].cast<String>();
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['picture'] = this.picture;
    data['description'] = this.description;
    data['farmerId'] = this.farmerId;
    data['categories'] = this.categories;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
