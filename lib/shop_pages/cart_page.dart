import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flipkart/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key,});

  @override
  Widget build(BuildContext context) {
    final cart=context.watch<CartProvider>().cart;
    final sum=context.watch<CartProvider>().sum;
    // for(int i=0;i<cart.length;i++){
    //   sum+=num.parse(cart[i]['price'].toStringAsFixed(2));
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart' , style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Expanded(
            child:
              ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final cartItem = cart[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                      radius: 40,
                      backgroundColor: const Color.fromARGB(255, 155, 235, 249),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Delete Product',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: const Text(
                                  "Are you sure you want to delete the product?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<CartProvider>().removeProduct(cartItem);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    title: Text(
                      cartItem['title'].toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    subtitle: cartItem['category']!='electronics'?Text('Size: ${cartItem['size']}'):Text('Color: ${cartItem['color']}'),
                  );
                },
              ),
          ),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
              child: ListTile(
                leading: const Text("Total Price ", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                trailing: Text("\$$sum" ,style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
              )
              ),
            
        ],
      ),
          
        
      );
    
  }
}
