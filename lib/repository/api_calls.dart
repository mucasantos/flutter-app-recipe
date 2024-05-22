import 'dart:developer';

import 'package:recipe_app/api/endpoints.dart';
import 'package:recipe_app/api/http_manager.dart';

HttpManager _httpManager = HttpManager();

class ApiCalls {
  static getCategories() async {
    try {
      log("PEgando categorias...");
      final response = await _httpManager.restRequest(
          url: Endpoints.cetegories, method: 'get');

      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    // log(response.data.toString());

    //return response.data;
  }

  static getRecipesOld(String category) async {
    final response = await _httpManager
        .restRequest(url: Endpoints.allRecipes, method: 'post', body: {
      "link": category,
    });
    log(response.toString());
    return response;
  }

  static getRecipes(String category) async {
    final response = await _httpManager.restRequest(
      url: Endpoints.searchRecipe + category,
      method: 'get',
    );
    // log(response.toString());
    return response;
  }

  static getOneRecipe(String recipe) async {
    final response = await _httpManager
        .restRequest(url: Endpoints.recipe, method: 'post', body: {
      "link": recipe,
    });
    log(response.toString());

    return response;
  }
}
