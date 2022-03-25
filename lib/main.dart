import 'package:flutter/material.dart';

import 'package:foodapp/dummy_data.dart';
import 'package:foodapp/screens/Filters.dart';
import '/screens/selecteditemlist.dart';
import '/screens/tab_screen.dart';
import 'moduls/meal.dart';
import 'screens/catagory_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filtered = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
 List<Meal> availableMeals = dummyMeal;

void setFilters(Map<String, bool> filterData) {
  setState(() {
      filtered = filterData;

    availableMeals = dummyMeal.where((meal) {
      if (filtered['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (filtered['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (filtered['vegan']! && !meal.isVegan) {
        return false;
      }
      if (filtered['vegetarian']!  && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  });
}




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: const TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              )),
        ),
        home: TabScreen(),
        routes: {
          CatagoryMealScreen.routeName: (context) => CatagoryMealScreen(availableMeals),
          SelectedItem.routeName: (context) => SelectedItem(),
          TabScreen.routeName: (context) => TabScreen(),
          Filter.routeName: (context) => Filter(filtered,setFilters),
        });
  }
}
