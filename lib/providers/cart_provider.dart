import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  final List<Map<String,dynamic>> cart=[];
  double sum=0;
  void addProduct(Map<String,dynamic> product){
    cart.add(product);
    sum=sum+product['price'];
    notifyListeners();
  }

  void removeProduct(Map<String,dynamic> product){
    cart.remove(product);
    sum=sum-product['price'];
    notifyListeners();
  }

}