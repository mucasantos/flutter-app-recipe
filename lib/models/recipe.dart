class RecipeData {
  DataRecipe? data;

  RecipeData({this.data});

  RecipeData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataRecipe.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataRecipe {
  String? title;
  String? image;
  List<dynamic>? ingredients;
  Recipe? recipe;

  DataRecipe({this.title, this.image, this.ingredients, this.recipe});

  DataRecipe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    ingredients = json['ingredients'];
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['ingredients'] = ingredients;
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    return data;
  }
}

class Recipe {
  List<Steps>? steps;

  Recipe({this.steps});

  Recipe.fromJson(Map<String, dynamic> json) {
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  String? text;
  String? image;

  Steps({this.text, this.image});

  Steps.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['image'] = image;
    return data;
  }
}
