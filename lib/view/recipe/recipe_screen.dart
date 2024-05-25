import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/allrecipes.dart';
import 'package:recipe_app/view/widgets/RCBackComponent.dart';

class RecipeScreen extends StatelessWidget {
  final Meals recipe;
  const RecipeScreen({
    super.key,
    required this.recipe,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(recipe.oneRecipe.value.title!.toUpperCase()),
      //  ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(recipe.strMealThumb!),
        )),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: Container(
                color: const Color.fromARGB(145, 255, 255, 255),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RCBackComponent(
                      color: Color.fromARGB(255, 57, 55, 55),
                      borderColor: Color.fromARGB(255, 57, 55, 55),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: const Color.fromARGB(145, 255, 255, 255),
                child: Text(
                  recipe.strInstructions ?? '',
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 57, 55, 55),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: recipe.strIngredient1!.isNotEmpty,
              child: const Positioned(
                bottom: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Passos',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
