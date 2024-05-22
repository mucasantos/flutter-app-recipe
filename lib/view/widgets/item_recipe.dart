import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/models/allrecipes.dart';
import 'package:recipe_app/utils/RCClipperPaths.dart';

class ItemRecipeWidget extends StatelessWidget {
  const ItemRecipeWidget({
    super.key,
    required this.element,
  });
  final Meals element;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            element.strMeal?.toUpperCase() ?? '',
          ),
          Expanded(
            child: ClipPath(
              clipper: BackgroundClipperThree(),
              child: Image.network(
                element.strMealThumb!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
