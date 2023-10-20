import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/view/widgets/RCBackComponent.dart';

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
              image: CachedNetworkImageProvider(
                recipe.oneRecipe.value.image!,
              ),
            )),
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 16,
                  right: 16,
                  child: Container(
                    color: const Color.fromARGB(145, 255, 255, 255),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const RCBackComponent(
                          color: Color.fromARGB(255, 57, 55, 55),
                          borderColor: Color.fromARGB(255, 57, 55, 55),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            recipe.oneRecipe.value.title!,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 57, 55, 55),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  right: 5,
                  left: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    color: const Color.fromARGB(145, 255, 255, 255),
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(16),
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                recipe.oneRecipe.value.ingredients!.map((text) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  text.toString().toUpperCase(),
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 57, 55, 55),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              );
                            }).toList()),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      recipe.oneRecipe.value.recipe?.steps?.isNotEmpty ?? false,
                  child: Positioned(
                    bottom: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
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
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 250,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              disableCenter: true,
                              autoPlay: false,
                            ),
                            items: recipe.oneRecipe.value.recipe!.steps!
                                .map((item) => Container(
                                      // width: 200,
                                      margin: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 200, 176, 240),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                item.image ??
                                                    "https://demofree.sirv.com/nope-not-here.jpg",
                                              ))),
                                      child: Container(
                                        color: const Color.fromARGB(
                                            69, 255, 255, 255),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
