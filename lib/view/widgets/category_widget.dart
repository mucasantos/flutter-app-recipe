import 'package:flutter/material.dart';
import 'package:recipe_app/models/categories.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.element,
  });
  final Categories element;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: size.height / 8,
      width: size.width / 3 - 16,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 200, 176, 240),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(
              element.image!,
              height: 80,
            ),
          ),
          Text(
            element.name?.toUpperCase() ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
