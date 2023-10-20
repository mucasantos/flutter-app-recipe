import 'package:get/get.dart';
import 'package:recipe_app/models/allrecipes.dart';
import 'package:recipe_app/models/categories.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/repository/api_calls.dart';

class RecipeController extends GetxController {
  RecipeController() {
    getCategories();
  }
  RxList<Categories> allCategories = <Categories>[].obs;
  RxList<Items> allRecipesFromCategory = <Items>[].obs;
  Rx<DataRecipe> oneRecipe = DataRecipe().obs;

  RxBool isLoading = false.obs;

  getCategories() async {
    isLoading.value = true;
    var result = await ApiCalls.getCategories();

    if (result != null) {
      var categories =
          RecipeCategories.fromJson(result as Map<String, dynamic>);

      allCategories.value = categories.data?.categories as List<Categories>;
      isLoading.value = false;
      update();
    }
  }

  getAllRecipes(String url) async {
    isLoading.value = true;
    var result = await ApiCalls.getRecipes(url);

    if (result != null) {
      var recipes = AllRecipes.fromJson(result as Map<String, dynamic>);

      allRecipesFromCategory.value = recipes.data!.items as List<Items>;
      isLoading.value = false;
      update();
    }
  }

  getOneRecipe(String url) async {
    isLoading.value = true;
    var result = await ApiCalls.getOneRecipe(url);

    print(result);
    if (result != null) {
      var recipe = RecipeData.fromJson(result as Map<String, dynamic>);

      oneRecipe.value = recipe.data!;
      isLoading.value = false;
      update();
    }
  }
}
