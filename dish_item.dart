import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:spice_lane/models/dish.dart';
import 'package:spice_lane/providers/cart.dart';
import 'package:spice_lane/providers/dishes.dart';
import '../screens/dish_details_screen.dart';

class DishItem extends StatelessWidget {
  // const DishItem({super.key});

  final String name;
  final double price;
  final String id;
  final String description;
  final String imageUrl;

  DishItem(this.name, this.price, this.id, this.description, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // final dish = Provider.of<Dish>(context);
    // final List<Dish> dish = Dishes().items;
    final dish = Dish(name: name, price: price, id: id, description: description, imageUrl: imageUrl);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54, 
          title: Text(name, textAlign: TextAlign.center),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart), 
            onPressed: () { 
              cart.addItem(dish.id, dish.price, dish.name);
             },
            ),
          ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(DishDetailsScreen.routeName, arguments: id);
          },
          child: Image.network(imageUrl, fit: BoxFit.cover,)
          
          ),
        
        ),
    );
  }
}