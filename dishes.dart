import 'package:flutter/material.dart';

import '../models/dish.dart';

class Dishes with ChangeNotifier{
  List<Dish> _items=[
    Dish(name: 'Chicken', price: 300, id: '1', description: 'This is marinated fried chicken', imageUrl: 'https://yummyatasteofneworleans.com/wp-content/uploads/2020/10/chicken-nuggets-blog.jpg'),
    Dish(name: 'Pizza', price: 400, id: '2', description: 'Chicke topped cheesse pizza', imageUrl: 'https://www.readersdigest.ca/wp-content/uploads/2010/12/pepperoni-pizza.jpg'),
  ];

  List<Dish> get items {
    return [..._items];
  }

  Dish findById(String id){
    return _items.firstWhere((prod) => prod.id==id);
  }
}