import 'dart:html';

import 'package:flutter/material.dart';
import 'package:foodapp/widgets/drawer.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);
  static const routeName = "/Filter";

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool islactose = false;
  bool isglucose = false;
  bool isvegeterian = false;
  bool isvegan = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(
              "Select your appropriate filter!!!",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SwitchListTile(
              value: islactose,
              title: Text(
                "Lactose free",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle:
                  const Text(" all meals in this category are lactose free "),
              onChanged: (bool value) {
                setState(() {
                  islactose = value;
                });
              },
            ),
            SwitchListTile(
              value: isglucose,
              title: Text(
                "glocose free",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle:
                  const Text(" all meals in this category are glucose free "),
              onChanged: (bool value) {
                setState(() {
                  isglucose = value;
                });
              },
            ),
            SwitchListTile(
              value: isvegeterian,
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle:
                  const Text(" all meals in this category are vegetarian "),
              onChanged: (bool value) {
                setState(() {
                  isvegeterian = value;
                });
              },
            ),
            SwitchListTile(
              value: isvegan,
              title: Text(
                "vegan",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle:
                  const Text(" all meals in this category are vegan "),
              onChanged: (bool value) {
                setState(() {
                  isvegan = value;
                });
              },
            ),
            Container(
              margin:const EdgeInsets.all(15.0) ,
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("save changes",style: Theme.of(context).textTheme.subtitle1,),
              )),
            )
            // SwitchListTile(value: value, onChanged: onChanged)
          ],
        ),
      ),
    );
  }
}
