import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:recipe_app/api/endpoints.dart';

final dio = Dio();

class ApiCalls {
  static getCategories() async {
    Response response;
    response = await dio.get(Endpoints.cetegories);
    // log(response.data.toString());

    return response.data;
  }

  static getRecipes(String category) async {
    Response response;
    response = await dio.post(Endpoints.allRecipes, data: {
      "link": category,
    });
    log(response.data.toString());
    return response.data;
  }

  static getOneRecipe(String recipe) async {
    Response response;
    response = await dio.post(Endpoints.recipe, data: {
      "link": recipe,
    });
    log(response.data.toString());

    return response.data;
  }
}
