//import 'package:flutter/cupertino.dart';
import 'package:flipkart/shop_pages/product_list_shoes.dart';
import 'package:flipkart/shop_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flipkart/shop_pages/cart_page.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter/widgets.dart';

class ShoesPage extends StatefulWidget {
  const ShoesPage({super.key});

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {

  int currentPage=0;
  List<Widget> pages= [
    const ProductListShoes(),
    CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
        
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage=value;
          });
        },
        currentIndex: currentPage,
        items:const [ BottomNavigationBarItem(
          label: '',
          icon:Icon(Icons.home),
        ),
         BottomNavigationBarItem(
          label: '',
          icon:Icon(Icons.shopping_cart),
        ),
        BottomNavigationBarItem(
          label: '',
          icon:Icon(Icons.person),
        ),
        ]
      ),
    );
  }
}
