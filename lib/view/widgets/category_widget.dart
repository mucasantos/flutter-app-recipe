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
    return Container(
      // color: Colors.blueGrey,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 176, 240),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                element.image!,
              ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(133, 158, 158, 158),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Text(
                element.name?.toUpperCase() ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
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
