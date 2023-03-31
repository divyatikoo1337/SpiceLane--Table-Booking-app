import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spice_lane/providers/cart.dart';
import 'package:spice_lane/providers/dishes.dart';
import 'package:spice_lane/screens/cart_screen.dart';
import 'package:spice_lane/screens/home_screen.dart';
import 'package:spice_lane/screens/previous_orders.dart';
import './screens/dish_details_screen.dart';
import 'package:spice_lane/screens/menu_screen.dart';

import 'models/dish.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
       create: (context) => Dishes(),
      ),
      ChangeNotifierProvider(
        create:(ctx) => Cart(),
      ),
      // ChangeNotifierProvider(
      //   create: (ctx) => Dish(),
      //   ),
    ], 
      child: MaterialApp(
        
        title: 'Spice Lane',
        theme: ThemeData(
          
          primarySwatch: Colors.orange,
        ),
        // home: MenuSceen(),
        home: HomeScreen(),
      
        routes: {
          DishDetailsScreen.routeName: (ctx)=> DishDetailsScreen(),
          MenuSceen.routeName:(ctx) => MenuSceen(),
          PreviousOrders.routeName: (ctx) => PreviousOrders(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  
//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
        
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: MenuSceen(),
//       ),
//     );
//   }
// }
