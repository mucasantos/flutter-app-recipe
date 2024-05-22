import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/view/all_recipes/all_recipes.dart';
import 'package:recipe_app/view/widgets/category_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  State<CategoryScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GetBuilder<RecipeController>(
          initState: (_) {},
          builder: (controller) {
            if (controller.isLoading.value) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/waiting.gif',
                  ),
                  //   Image.asset('assets/images/loading.gif'),
                ],
              );
            }

            if (controller.hasError.value) {
              EasyLoading.dismiss();

              return Column(
                children: [
                  Image.asset(
                    'assets/images/error.jpg',
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await controller.getCategories();
                      },
                      child: const Text('Tente novamente'))
                ],
              );
            }

            return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.allCategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (_, int index) {
                  return GestureDetector(
                    onTap: () async {
                      EasyLoading.show();
                      await controller
                          .getAllRecipes(controller.allCategories[index].name!);

                      Get.to(() => AllRecipesScreen(
                          title: controller.allCategories[index].name!));
                      EasyLoading.dismiss();
                    },
                    child: CategoryWidget(
                        element: controller.allCategories[index]),
                  );
                });

/*
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: controller.allCategories.map((element) {
                      //Por causa do webscrapping, um dos dados vem com o dado "mais"...

                      return GestureDetector(
                        onTap: () async {
                          EasyLoading.show();
                          await controller.getAllRecipes(element.image!);

                          Get.to(() => AllRecipesScreen(title: element.name!));
                          EasyLoading.dismiss();
                        },
                        child: CategoryWidget(
                          element: element,
                        ),
                      );
                    }).toList()),
              ),
            );

            */
          }),
    ));
  }
}
