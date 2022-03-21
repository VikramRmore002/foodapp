import 'package:flutter/material.dart';
import 'package:foodapp/dummy_data.dart';
import '../widgets/categoryitem.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(15),
          children: dummyData.map((catdata) => CategoryItem( title: catdata.title,color: catdata.color, id: catdata.id,)).toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),);

  }


}
