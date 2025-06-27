class CategoryModel {
  final String? sId;
  final String? name;
  final String? description;
  final String? by;
  final String? icon;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  bool checked;

  CategoryModel({
    this.sId,
    this.name,
    this.description,
    this.by,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.checked = false, // Pour le checking de la page2 du Onboarding
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      sId: json['_id'],
      name: json['name'],
      description: json['description'],
      by: json['by'],
      icon: json['icon'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'name': name,
        'description': description,
        'by': by,
        'icon': icon,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': iV
      };
}
