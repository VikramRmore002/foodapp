import 'package:flutter/material.dart';

import '../moduls/meal.dart';
import '../screens/selecteditemlist.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.affordability,
    required this.complexity,
    required this.duration,
  });

  String get affordabilityText {
    switch(affordability){
      case Affordability.Affordable:
        return "affordable";
        break;
      case Affordability.Pricey:
        return "pricey";
        break;
      case Affordability.Luxurious:
        return "luxurious";
        break;
    }
  }




  String get complexityText {
    switch(complexity){
      case Complexity.Challenging:
        return"challenging";
        break;
      case Complexity.Hard:
        return "hard";
        break;
      case Complexity.Simple:
        return"simple";
        break;
    }
  }
 void selctedItem (BuildContext context){
    Navigator.of(context).pushNamed(SelectedItem.routeName,arguments: id);

 }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selctedItem(context),
      child: Card(
        margin: const EdgeInsets.all(15),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    const Icon(Icons.schedule,),
                    const SizedBox(width: 6,),
                    Text('$duration min'),
                  ],),
                  Row(children: <Widget>[
                    const Icon(Icons.work,),
                    const SizedBox(width: 6,),
                    Text(complexityText),
                  ],),
                  Row(children: <Widget>[
                    const Icon(Icons.attach_money,),
                    const SizedBox(width: 6,),
                    Text(affordabilityText),
                  ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
