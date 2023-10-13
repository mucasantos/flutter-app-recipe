import 'package:flutter/material.dart';
import 'package:recipe_app/models/allrecipes.dart';

class ItemRecipeWidget extends StatelessWidget {
  const ItemRecipeWidget({
    super.key,
    required this.element,
  });
  final Items element;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 176, 240),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                element.image!,
              ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color.fromARGB(133, 158, 158, 158),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Text(
                element.name?.toUpperCase() ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
