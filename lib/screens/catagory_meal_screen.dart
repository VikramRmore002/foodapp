import 'package:flutter/material.dart';
import 'package:foodapp/dummy_data.dart';

import '../widgets/mealitem.dart';

class CatagoryMealScreen extends StatelessWidget {
  static const routeName = "/catagory_item";

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catagoryTitle = routeArg["title"];
    final catagoryId = routeArg["id"];
    final catagorymeals = dummyMeal.where((meal) {
      return meal.categories.contains(catagoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catagoryTitle!,
          style: ThemeData.light().textTheme.bodyText1,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, int index) {
          return MealItem(
            id: catagorymeals[index].id,
            title: catagorymeals[index].title,
            affordability: catagorymeals[index].affordability,
            complexity: catagorymeals[index].complexity,
            duration: catagorymeals[index].duration,
            imageUrl: catagorymeals[index].imageUrl,
          );
        },
        itemCount: catagorymeals.length,
      ),
    );
  }
}
