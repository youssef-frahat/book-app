class ModelBook {
  int? id;
  String? title;
  String? category;
  String? description;
  String? price;
  String? image;

  ModelBook(
      {this.id,
      this.title,
      this.category,
      this.description,
      this.price,
      this.image});

  ModelBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['category'] = category;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}