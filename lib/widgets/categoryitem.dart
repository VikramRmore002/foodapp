import 'package:flutter/material.dart';
import 'package:foodapp/screens/catagory_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  const CategoryItem( {
    required this.title,
    required this.id,
    required this.color,
  });

  void selectCatagory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CatagoryMealScreen.routeName,
      arguments: {"id": id, "title": title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { selectCatagory(context);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
