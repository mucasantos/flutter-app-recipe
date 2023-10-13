import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/recipe_controller.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecipeController>(
      initState: (_) {},
      builder: (recipe) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(recipe.oneRecipe.value.title!.toUpperCase()),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(recipe.oneRecipe.value.image!),
                const SizedBox(
                  height: 10,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.oneRecipe.value.ingredients!.map((text) {
                      return Text(
                        text.toString().toUpperCase(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      );
                    }).toList()),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Passos',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    disableCenter: false,
                  ),
                  items: recipe.oneRecipe.value.recipe!.steps!
                      .map((item) => Container(
                            width: 300,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 200, 176, 240),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      item.image ??
                                          "https://demofree.sirv.com/nope-not-here.jpg",
                                    ))),
                            child: Container(
                              color: const Color.fromARGB(69, 255, 255, 255),
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.text!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
