import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/dummy_data.dart';

class SelectedItem extends StatelessWidget {
  static const routeName = "/selectedItem";

  Widget BuildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      //margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      height: 215,
      width: 300,
      child: child,
    );
  }

  Widget BuildContainerTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context)?.settings.arguments as String ;
     print("mealid == " + "$mealId");
    final catagorylist = dummyMeal.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catagorylist.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 250,
              // width: 250,
              child: Image.network(
                catagorylist.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildContainerTitle(context, "Ingredients"),
            BuildContainer(ListView.builder(
                itemCount: catagorylist.ingredients.toList().length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10 ),
                      child: Text(catagorylist.ingredients[index]),
                    ),
                  );
                })),
            BuildContainerTitle(context, "Steps"),
            BuildContainer(ListView.builder(itemBuilder: (context,index ) =>  Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text("# ${index + 1}"),
                  ),
                  title: Text(catagorylist.steps[index]),
                ),
                const Divider(),
              ],
            ),
            itemCount: catagorylist.steps.length,)),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop(mealId);
        } ,
        child: Icon(Icons.delete),
      ),
    );
  }
}
