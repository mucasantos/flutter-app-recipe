import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/view/categories/categories_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key, required this.title});
  final String title;

  @override
  State<DashBoard> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashBoard> {
  int _selectedIndex = 0;
  final pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Sobre',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 177, 142, 233),
          onTap: _onItemTapped,
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            GetBuilder<RecipeController>(builder: (controller) {
              if (controller.hasError.value) {
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
              } else {
                return Column(
                  children: [
                    Image.asset(
                      'assets/images/mulher-cozinha.jpg',
                    )
                  ],
                );
              }
            }),
            const CategoryScreen(),
            Container()
          ],
        ));
  }
}
