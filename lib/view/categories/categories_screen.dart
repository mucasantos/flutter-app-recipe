import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/view/all_recipes/all_recipes.dart';
import 'package:recipe_app/view/widgets/category_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<RecipeController>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<RecipeController>(
          builder: (controller) {
            if (controller.isLoading.value) {
              return _buildLoading();
            } else if (controller.hasError.value) {
              return _buildError(controller);
            } else {
              return _buildGridView(controller);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/waiting.gif'),
      ],
    );
  }

  Widget _buildError(RecipeController controller) {
    EasyLoading.dismiss();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/error.jpg'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            await controller.getCategories();
          },
          child: const Text('Tente novamente'),
        ),
      ],
    );
  }

  Widget _buildGridView(RecipeController controller) {
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
            Get.to(() =>
                AllRecipesScreen(title: controller.allCategories[index].name!));
            EasyLoading.dismiss();
          },
          child: CategoryWidget(element: controller.allCategories[index]),
        );
      },
    );
  }
}
