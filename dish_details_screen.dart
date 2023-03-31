import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:spice_lane/providers/dishes.dart';
import '../widgets/dish_item.dart';

class DishDetailsScreen extends StatelessWidget {
  const DishDetailsScreen({super.key});

  static const routeName = '/dish-Details-Screen';

  @override
  Widget build(BuildContext context) {
    final productId  = ModalRoute.of(context)?.settings.arguments as String;
  final loadedDish = Provider.of<Dishes>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedDish.name),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
              child: Image.network(loadedDish.imageUrl, fit: BoxFit.cover,),
            ),
             Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(loadedDish.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            Center(child: Text('\$${loadedDish.price}', style: TextStyle(fontSize: 20),),),
            Container(
              color: Colors.orange,
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: (){}, 
                child: Text('Add To Cart', style: TextStyle(color: Colors.black,),),
                ),
            )
          ],
        ),
      ),
    );
  }
}