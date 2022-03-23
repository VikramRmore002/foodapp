import 'dart:html';

import 'package:flutter/material.dart';
import 'package:foodapp/screens/Filters.dart';
import 'package:foodapp/screens/favorite.dart';

import '../screens/tab_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Text("lets Cook it",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
          ),
          Card(
            elevation: 5,
            child: ListTile(
                leading: Icon(Icons.category),
                title: const Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Roboto"),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(TabScreen.routeName);
                }),
          ),
          // SizedBox(height: 20,),
          Card(
            elevation: 5,
            child: ListTile(
                leading: Icon(Icons.settings),
                title: const Text(
                  'Filter',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Roboto"),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Filter.routeName);
                }),
          ),
        ],
      ),
    );
  }
}
