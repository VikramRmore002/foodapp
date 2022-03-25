import 'package:flutter/material.dart';
import 'package:foodapp/dummy_data.dart';

import '../moduls/meal.dart';
import '../widgets/mealitem.dart';

class CatagoryMealScreen extends StatefulWidget {
  static const routeName = "/catagory_item";
  List<Meal> availableMeal;
  CatagoryMealScreen(this.availableMeal);

  @override
  State<CatagoryMealScreen> createState() => _CatagoryMealScreenState();
}

class _CatagoryMealScreenState extends State<CatagoryMealScreen> {
  late  String categorytitle;
  late  List<Meal> displayMeal;

   isDeleted(String mealId){
    setState(() {
      displayMeal.removeWhere((element) => element.id == mealId);

    });
  }
  @override
  void didChangeDependencies() {
    final routeArg =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
     categorytitle = routeArg["title"] as String;
    var catagoryId = routeArg["id"];
     displayMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(catagoryId);
    }).toList();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categorytitle,
          style: ThemeData.light().textTheme.bodyText1,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, int index) {
          return MealItem(
            id: displayMeal[index].id,
            title: displayMeal[index].title,
            affordability: displayMeal[index].affordability,
            complexity: displayMeal[index].complexity,
            duration: displayMeal[index].duration,
            imageUrl: displayMeal[index].imageUrl,
            isDeleted: isDeleted,
          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
