class RecipeCategories {
  //String? message;
  List<Categories>? categories;

  RecipeCategories({this.categories});

  RecipeCategories.fromJson(Map<String, dynamic> json) {
    categories = <Categories>[];
    json['categories']?.forEach((v) {
      categories!.add(Categories.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!;
    }
    return data;
  }
}

class Categories {
  String? name;
  String? image;
  String? strCategoryDescription;

  Categories({
    this.name,
    this.image,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['strCategory'];
    strCategoryDescription = json['strCategoryDescription'];
    image = json['strCategoryThumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strCategory'] = name;
    data['strCategoryDescription'] = strCategoryDescription;
    data['strCategoryThumb'] = image;
    return data;
  }
}
