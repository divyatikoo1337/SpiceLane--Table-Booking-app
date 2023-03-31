import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:spice_lane/providers/dishes.dart';

import '../models/dish.dart';
import 'dish_item.dart';

class MenuDishesGrid extends StatelessWidget {
  // const MenuDishesGrid({
  //   super.key,
  //   required this.loadedDishes,
  // });

   
  // List<Dish> loadedDishes = [];

  @override
  Widget build(BuildContext context) {
    // List<Dish> dishes = Dishes().items;
    final dishesData = Provider.of<Dishes>(context);
    final dishes = dishesData.items;
    return GridView.builder(
     padding: EdgeInsets.all(10),
       itemCount: dishes.length,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         crossAxisSpacing: 10,
         mainAxisSpacing: 10,
         childAspectRatio: 3/2,
         ), 
       itemBuilder: (ctx, i)=> DishItem(dishes[i].name, dishes[i].price, dishes[i].id, dishes[i].description, dishes[i].imageUrl),
       );
  }
}