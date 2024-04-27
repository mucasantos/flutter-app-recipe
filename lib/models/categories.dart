class RecipeCategories {
  String? message;
  List<Categories>? categories;

  RecipeCategories({this.message, this.categories});

  RecipeCategories.fromJson(Map<String, dynamic> json) {
    categories = <Categories>[];
    message = json['message'];
    json['data']?.forEach((v) {
      categories!.add(Categories.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (categories != null) {
      data['data'] = categories!;
    }
    return data;
  }
}

class Categories {
  String? name;
  String? link;
  // String? image;

  Categories({
    this.name,
    this.link,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
    //image = json['image'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['link'] = link;
    //  data['image'] = image;
    return data;
  }
}
