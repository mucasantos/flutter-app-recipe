import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/view/all_recipes/all_recipes.dart';
import 'package:recipe_app/view/widgets/category_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key, required this.title});
  final String title;

  @override
  State<DashBoard> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashBoard> {
  // RecipeController recipe = RecipeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
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
                        children: controller.allCategories.map((element) {
                          //Por causa do webscrapping, um dos dados vem com o dado "mais"...
                          if (element.image == null) {
                            return Container();
                          }
                          return GestureDetector(
                            onTap: () async {
                              EasyLoading.show();
                              await controller.getAllRecipes(element.link!);
                              Get.to(
                                  () => AllRecipesScreen(title: element.name!));
                              EasyLoading.dismiss();
                            },
                            child: CategoryWidget(
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
