//String server = "recipes-nkpy.onrender.com/";
String server = "www.themealdb.com/api/json/v1/1/";

abstract class Endpoints {
  static String cetegories = "https://${server}categories.php";
  static String allRecipes = "https://${server}recipes";
  static String recipe = "https://${server}recipe";
  static String searchRecipe =
      "https://www.themealdb.com/api/json/v1/1/search.php?s="; // s=nomecategory
}
