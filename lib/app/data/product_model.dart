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
  List<String>? likesList;

  ProductModel(
      {this.sId,
      this.name,
      this.price,
      this.picture,
      this.description,
      this.farmerId,
      this.categories,
      this.createdAt,
      this.iV,
      this.likesList});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    picture = json['picture'];
    description = json['description'];
    farmerId = json['farmerId'];
    categories = json['categories'].cast<String>();
    createdAt = json['createdAt'];
    likesList = json['likesList'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['price'] = price;
    data['picture'] = picture;
    data['description'] = description;
    data['farmerId'] = farmerId;
    data['categories'] = categories;
    data['createdAt'] = createdAt;
    data['likesList'] = likesList;
    data['__v'] = iV;
    return data;
  }
}
