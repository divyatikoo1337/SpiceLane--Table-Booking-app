import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:spice_lane/providers/cart.dart';

class CartItem extends StatelessWidget {
  // const CartItem({super.key});

  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;

  CartItem(this.id, this.productId, this.price, this.quantity, this.name);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction){
          Provider.of<Cart>(context, listen: false).removeItem(productId);
        },
      child: Card(
        // margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10), 
          child: ListTile(
            leading: CircleAvatar(child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(child: Text("\$${price}")),
            ),),
            title: Text(name),
            subtitle: Text("Total: \$${quantity*price}"),
            trailing: Text(' x$quantity '),
          ),
          ),
      ),
    );
  }
}