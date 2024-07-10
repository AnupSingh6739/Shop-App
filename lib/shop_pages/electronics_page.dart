//import 'package:flutter/cupertino.dart';
import 'package:flipkart/shop_pages/product_list_electronics.dart';
import 'package:flipkart/shop_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flipkart/shop_pages/cart_page.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter/widgets.dart';

class ElectronicsPage extends StatefulWidget {
  const ElectronicsPage({super.key});

  @override
  State<ElectronicsPage> createState() => _ElectronicsPageState();
}

class _ElectronicsPageState extends State<ElectronicsPage> {

  int currentPage=0;
  List<Widget> pages=  [
    const ProductListElectronics(),
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
