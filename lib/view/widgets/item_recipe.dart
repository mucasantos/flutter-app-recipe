import 'package:flutter/material.dart';
import 'package:recipe_app/models/allrecipes.dart';
import 'package:recipe_app/utils/RCClipperPaths.dart';

class ItemRecipeWidget extends StatelessWidget {
  const ItemRecipeWidget({
    super.key,
    required this.element,
  });
  final Items element;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.timelapse_outlined),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    element.duration?.toUpperCase() ?? '',
                  ),
                ],
              ),
            ],
          ),
          ClipPath(
            clipper: BackgroundClipperThree(),
            child: Image.network(
              element.image!,
            ),
          ),
          Text(
            element.name!,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
