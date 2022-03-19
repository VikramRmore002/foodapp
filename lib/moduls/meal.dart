import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> steps;
  final List<String> ingredients;
  final Complexity complexity;
  final Affordability affordability;
  final String imageUrl;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

 const Meal(
      {required this.affordability,
      required this.id,
      required this.title,
      required this.categories,
      required this.duration,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.steps,
      required this.imageUrl,
      required this.ingredients,
      required this.isGlutenFree,
      required this.complexity});
}
