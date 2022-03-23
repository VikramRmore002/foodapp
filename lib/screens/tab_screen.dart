import 'package:flutter/material.dart';
import 'package:foodapp/screens/catagory_meal_screen.dart';
import 'package:foodapp/screens/favorite.dart';
import 'package:foodapp/screens/myhomepagescreen.dart';
import 'package:foodapp/widgets/drawer.dart';

class TabScreen extends StatefulWidget {
  static const routeName = "/Tabscreen";

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int selectedPageIndex = 0;
 // final List<Map<String, Object>>? Tabs = [
 //    {"tab": CatagoryMealScreen(), "title": "Categories"},
 //    {"tab": Favorite(), "title": "Favorite"},
 //  ];
  final List<Map<String, dynamic>> pages = [
    {
      'page': MyHomePage(),
      'title': 'Categories',
    },
    {
      'page': Favorite(),
      'title': 'Your Favorite',
    },
  ];
  void SelectedTab(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( pages[selectedPageIndex]['title'] ),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: SelectedTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: ('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: ('Favorites'),
          ),
        ],
      ),
    );
  }
}
