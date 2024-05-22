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
  RxList<Meals> allRecipesFromCategory = <Meals>[].obs;
  Rx<DataRecipe> oneRecipe = DataRecipe().obs;

  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;

  getCategories() async {
    isLoading.value = true;
    var result = await ApiCalls.getCategories();

    if (result['error'] != null) {
      Get.snackbar('Error', result['error']);
      hasError.value = true;
      isLoading.value = false;
      update();
    }

    if (result != null) {
      var categories =
          RecipeCategories.fromJson(result as Map<String, dynamic>);

      allCategories.value = categories.categories as List<Categories>;
      isLoading.value = false;
      hasError.value = false;

      update();
    }
  }

  getAllRecipes(String url) async {
    isLoading.value = true;

    final result = await ApiCalls.getRecipes(url);

    if (result['error'] != null) {
      Get.snackbar('Error', result['error']);
      hasError.value = true;
      isLoading.value = false;
      update();
    }
    print(result);

    if (result != null) {
      var recipes = Recipes.fromJson(result);

      allRecipesFromCategory.value = recipes.meals;
      isLoading.value = false;
      update();
    }
  }

  getOneRecipe(String url) async {
    isLoading.value = true;
    var result = await ApiCalls.getOneRecipe(url);

    if (result['error'] != null) {
      Get.snackbar('Error', result['error']);
      hasError.value = true;
      isLoading.value = false;
      update();
    }

    if (result != null) {
      var recipe = RecipeData.fromJson(result as Map<String, dynamic>);

      oneRecipe.value = recipe.data!;
      isLoading.value = false;
      update();
    }
  }
}
