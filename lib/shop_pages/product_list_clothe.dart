import 'package:flipkart/shop_pages/clothes_page.dart';
import 'package:flipkart/shop_pages/electronics_page.dart';
import 'package:flipkart/shop_pages/featured_page.dart';
import 'package:flipkart/shop_pages/shoes_page.dart';
import 'package:flipkart/shop_pages/utensils_page.dart';
import 'package:flutter/material.dart';
import 'package:flipkart/global/global_variables.dart';
import 'package:flipkart/widgets/product_card.dart';
import 'package:flipkart/shop_pages/product_details_page.dart';

class ProductListClothes extends StatefulWidget {
  const ProductListClothes({super.key});

  @override
  State<ProductListClothes> createState() => _ProductListClothesState();
}

class _ProductListClothesState extends State<ProductListClothes> {
  final List<String> filters = const ['Featured','Shoes', 'Electronics', 'Clothes', 'Utensils'];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = "Clothes";
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Clothes',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if(selectedFilter!=filter){
                      setState(() {
                          if(filter=="Featured"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                              const FeaturedPage(),
                            ));
                          }
                          if(filter=="Electronics"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                              const ElectronicsPage(),
                            ));
                          }
                          if(filter=="Shoes"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                              const ShoesPage(),
                            ));
                          }
                          if(filter=="Clothes"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                              const ClothesPage(),
                            ));
                          }
                          if(filter=="Utensils"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                              const UtensilsPage(),
                            ));
                          }
                        
                      });
                      }
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1080) {
                  return GridView.builder(
                    itemCount: clotheproducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.75,
                    ),
                    itemBuilder: (context, index) {
                      final product = clotheproducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['itle'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: clotheproducts.length,
                    itemBuilder: (context, index) {
                      final product = clotheproducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}