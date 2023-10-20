import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RCBackComponent extends StatelessWidget {
  final Color color;
  final Color borderColor;

  const RCBackComponent({
    Key? key,
    required this.color,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: color),
          onPressed: () {
            Get.back();
          },
        ));
  }
}
