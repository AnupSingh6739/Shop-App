import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipkart/product/product.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  // Add to cart
  Future<void> addToCart(Product product) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await userCollection.doc(user.uid).update({
        'cart': FieldValue.arrayUnion([product.toFirestore()])
      });
    }
  }

  // Remove from cart
  Future<void> removeFromCart(Product product) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await userCollection.doc(user.uid).update({
        'cart': FieldValue.arrayRemove([product.toFirestore()])
      });
    }
  }

  // Fetch user cart
  Future<List<Product>> fetchCart() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await userCollection.doc(user.uid).get();
      List<dynamic> cart = doc['cart'];
      print(cart);
      return cart.map((item) => Product.fromFirestore(item)).toList();
    }
    return [];
  }
}
