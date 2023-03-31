import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spice_lane/widgets/drawer.dart';

import '../providers/badge.dart';
import '../providers/cart.dart';
import '../widgets/menu_dishes_grid.dart';
import '../widgets/dish_item.dart';
import 'cart_screen.dart';

class MenuSceen extends StatelessWidget {
  // const DishItem({super.key});
  static const routeName = '/menuScreen';

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      // drawer: MyDrawer(),
      appBar: AppBar(title: Text("Menu"), actions: [
          Consumer<Cart>(
            builder: (_, cart, c) => Badge(
              value: cart.itemCount.toString(),
              // child: c,
              child: IconButton(
                icon: Icon(Icons.shopping_cart), 
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
               },),

              ),
              // child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {  },),
            ),
            ],),
       body: MenuDishesGrid(),
     );
  }
}

