import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

class CartItem{
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  }) ;
}

class Cart with ChangeNotifier{
  late Map<String, CartItem> _items = {} ;
  
  Map<String, CartItem> get items{
    return {..._items};
  }

  int get itemCount{
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
     });
     return total;
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void addItem(String productId, double price, String name){
    if(_items.containsKey(productId)){
      _items.update(
        productId, (existingItem) => CartItem(
          id: existingItem.id, 
          name:existingItem .name, 
          price: existingItem.price, 
          quantity: existingItem.quantity+1,
          ));
    }else{
      _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), name: name, price: price, quantity: 1));
    }
    notifyListeners();
  }
}