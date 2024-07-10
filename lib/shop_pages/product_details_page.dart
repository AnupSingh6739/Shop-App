import 'package:flipkart/product/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../User/user_service.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  String selectedcolor="";
  final UserService _userService = UserService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 200,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.product['category']!='electronics'? (widget.product['sizes'] as List<int>).length : (widget.product['colors'] as List<String>).length ,
                      itemBuilder: (context, index) {
                        if(widget.product['category']!='electronics'){
                        final size = 
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              label: Text(size.toString()),
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        );
                      }
                      else{
                        final color = 
                            (widget.product['colors'] as List<String>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedcolor = color;
                              });
                            },
                            child: Chip(
                              label: Text(color.toString()),
                              backgroundColor: selectedcolor == color
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        );
                      }
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ElevatedButton.icon(
            
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      if (selectedSize != 0 ||
                          selectedcolor != "") {
                        if (selectedSize != 0) {

                            _userService.addToCart(
                              Product(id: widget.product['id'].toString(), color:"", size: selectedSize, category: widget.product['category'].toString(), imageUrl: widget.product['imageUrl'].toString(), title: widget.product['title'].toString(), company: widget.product['company'].toString(), price: widget.product['price'] as double)
                            );
                            print(UserService);
                        
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product Added Successfully'),
                            ),
                          );
                        }
                        
                        else{
                          _userService.addToCart(
                              Product(id: widget.product['id'].toString(), color:selectedcolor, size:0, category: widget.product['category'].toString(), imageUrl: widget.product['imageUrl'].toString(), title: widget.product['title'].toString(), company: widget.product['company'].toString(), price: widget.product['price'] as double)
                            );
                        
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product Added Successfully'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a size or color'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(350, 40),
                    ),
                    label: const Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
