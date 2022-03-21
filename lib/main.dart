import 'package:flutter/material.dart';

import '/screens/selecteditemlist.dart';
import '/screens/tab_screen.dart';
import 'screens/catagory_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
        initialRoute: "/",
      routes: {
        // "/":(context) => MyHomePage(),
        CatagoryMealScreen.routeName : (context)=> CatagoryMealScreen(),
        SelectedItem.routeName : (context)=> SelectedItem(),
      }
    );
  }
}
