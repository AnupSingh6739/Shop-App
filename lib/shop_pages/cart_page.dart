import 'dart:ffi';

import 'package:flipkart/User/user_service.dart';
import 'package:flipkart/product/product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final UserService _userService = UserService();
  List<Product> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }
  

  Future<void> _fetchCartItems() async {
    List<Product> cartItems = await _userService.fetchCart();
    if(cartItems.isNotEmpty)
    debugPrint("${cartItems[0].title}");
    else
    debugPrint("CartItems is Empty");
    setState(() {
      _cartItems = cartItems;
    });
  }

  Future<void> _removeFromCart(Product product) async {
    await _userService.removeFromCart(product);
    _fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    if(_cartItems.isNotEmpty){
     print("${_cartItems[0].title}");
    }
    else{
      print('_CartItems is Empty');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
                  itemCount: _cartItems.length,
                  itemBuilder: (context, index) {
                    final product = _cartItems[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Image.network(product.imageUrl, width: 50, height: 50),
                        title: Text(product.title),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_shopping_cart),
                          onPressed: () {
                            _removeFromCart(product);
                          },
                        ),
                      ),
                    );
                  },
                )
                );
  }
}
