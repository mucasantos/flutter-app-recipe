import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/view/recipe/recipe_screen.dart';
import 'package:recipe_app/view/widgets/item_recipe.dart';

class AllRecipesScreen extends StatefulWidget {
  const AllRecipesScreen({super.key, required this.title});
  final String title;

  @override
  State<AllRecipesScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AllRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title.toUpperCase()),
        ),
        body: GetBuilder<RecipeController>(
            initState: (_) {},
            builder: (controller) {
              if (controller.isLoading.value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/waiting.gif',
                      ),
                      //   Image.asset('assets/images/loading.gif'),
                    ],
                  ),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        children:
                            controller.allRecipesFromCategory.map((element) {
                          //Por causa do webscrapping, um dos dados vem com o dado "mais"...
                          if (element.name == null) {
                            return Container();
                          }
                          return GestureDetector(
                            onTap: () async {
                              EasyLoading.show();
                              await controller.getOneRecipe(element.link!);
                              Get.to(() => const RecipeScreen());
                              EasyLoading.dismiss();
                            },
                            child: ItemRecipeWidget(
                              element: element,
                            ),
                          );
                        }).toList()),
                  )
                ],
              );
            }));
  }
}
