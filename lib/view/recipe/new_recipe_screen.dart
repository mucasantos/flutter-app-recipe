import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recipe_app/models/allrecipes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewRecipeScreen extends StatefulWidget {
  const NewRecipeScreen({
    super.key,
    required this.recipe,
  });
  final Meals recipe;

  @override
  State<NewRecipeScreen> createState() => _NewRecipeScreenState();
}

class _NewRecipeScreenState extends State<NewRecipeScreen> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  List<Map<dynamic, dynamic>> ingredientsImageAndMeasure = [];
  List<String> ingredientsName = [];
  var key;
  var value;

  listIngredientsToImage(List<Map<dynamic, dynamic>>? ingredients) {
    ingredientsImageAndMeasure.clear();
    String url = "https://www.themealdb.com/images/ingredients/";
    for (var i = 1; i < 20; i++) {
      if (!ingredients![i].keys.contains('') &&
          !ingredients[i].values.contains('')) {
        ingredientsName.add(ingredients[i]
            .keys
            .toString()
            .replaceAll('(', '')
            .replaceAll(')', ''));

        key =
            '$url${ingredients[i].keys.toString().replaceAll('(', '').replaceAll(')', '')}-small.png';
        value = ingredients[i]
            .values
            .toString()
            .replaceAll('(', '')
            .replaceAll(')', '');

        ingredientsImageAndMeasure.add({key: value});

        //  ingredientsImage.add('${url + ingredients?[i]}-small.png');
      }
    }

    //  print(widget.recipe.strYoutube!.split("=")[1]);
    // _controller.load(widget.recipe.strYoutube!.split("=")[1]);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.recipe.strYoutube!.split("=")[1],
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    // ..addListener(listener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> ingredients = [
      {widget.recipe.strIngredient1: widget.recipe.strMeasure1},
      {widget.recipe.strIngredient2: widget.recipe.strMeasure2},
      {widget.recipe.strIngredient3: widget.recipe.strMeasure3},
      {widget.recipe.strIngredient4: widget.recipe.strMeasure4},
      {widget.recipe.strIngredient5: widget.recipe.strMeasure5},
      {widget.recipe.strIngredient6: widget.recipe.strMeasure6},
      {widget.recipe.strIngredient7: widget.recipe.strMeasure7},
      {widget.recipe.strIngredient8: widget.recipe.strMeasure8},
      {widget.recipe.strIngredient9: widget.recipe.strMeasure9},
      {widget.recipe.strIngredient10: widget.recipe.strMeasure10},
      {widget.recipe.strIngredient11: widget.recipe.strMeasure11},
      {widget.recipe.strIngredient12: widget.recipe.strMeasure12},
      {widget.recipe.strIngredient13: widget.recipe.strMeasure13},
      {widget.recipe.strIngredient14: widget.recipe.strMeasure14},
      {widget.recipe.strIngredient15: widget.recipe.strMeasure15},
      {widget.recipe.strIngredient16: widget.recipe.strMeasure16},
      {widget.recipe.strIngredient17: widget.recipe.strMeasure17},
      {widget.recipe.strIngredient18: widget.recipe.strMeasure18},
      {widget.recipe.strIngredient19: widget.recipe.strMeasure19},
      {widget.recipe.strIngredient20: widget.recipe.strMeasure20},
    ];
    listIngredientsToImage(ingredients);
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            titleSpacing: 0,
            title: Container(
              margin: const EdgeInsets.only(right: 16),
              //   decoration:
              //      const BoxDecoration(
              //color: Color.fromARGB(128, 151, 91, 186)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(157, 167, 160, 160),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          widget.recipe.strMeal!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: widget.recipe.strMealThumb!,
                fit: BoxFit.fill,
              ),
            ),
          )
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(157, 167, 160, 160),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    widget.recipe.strArea!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(widget.recipe.strImageSource ?? ''),
            YoutubePlayer(
              controller: _controller,
              onReady: () {
                _isPlayerReady = true;
              },
            ),
            Text(widget.recipe.strMeasure1 ?? ''),
            const Text(
              "Instructions",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              color: Theme.of(context).colorScheme.inversePrimary,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.recipe.strInstructions!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              children: ingredientsImageAndMeasure
                  .map((e) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 100,
                            height: 150,
                            child: Column(
                              children: [
                                Text(
                                    ingredientsName[
                                        ingredientsImageAndMeasure.indexOf(e)],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Expanded(
                                  child: Image.network(e.keys
                                      .toString()
                                      .replaceAll('(', '')
                                      .replaceAll(')', '')),
                                ),
                                Text(e.values
                                    .toString()
                                    .replaceAll('(', '')
                                    .replaceAll(')', '')),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ).paddingAll(16),
      ),
    );

    /* Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(recipe.strMeal!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(
                children: [
                  Image.network(recipe.strMealThumb!,
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      fit: BoxFit.fill),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Container(
                      color: const Color.fromARGB(66, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              recipe.strMeal!,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(recipe.strArea!),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(recipe.strImageSource ?? ''),
            //Adicionar vídeo player
            Text(recipe.strYoutube ?? ''),
            Text(recipe.strMeasure1 ?? ''),
            const Text(
              "Instructions",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              color: Theme.of(context).colorScheme.inversePrimary,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  recipe.strInstructions!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Wrap(
              children: ingredientsImage.map((e) => Image.network(e)).toList(),
            )
          ],
        ).paddingAll(16),
      ),
    );
    */
  }
}
