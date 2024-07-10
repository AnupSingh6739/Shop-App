import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String category;
  final String imageUrl;
  final String title;
  final double price;
  final String company;
  final String color;
  final int size;


  Product({
    required this.id,
    required this.color,
    required this.size,
    required this.category,
    required this.imageUrl,
    required this.title,
    required this.company,
    required this.price,
  });

  // Factory method to create a Product from a Firestore document
  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      company: data['company'],
      category: data['category'],
      imageUrl: data['imageUrl'],
      title: data['title'],
      price: data['price'],
      color: data['color'],
      size: data['size'],
    );
  }

  // Method to convert a Product to a Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'category': category,
      'imageUrl': imageUrl,
      'company':company,
      'price': price,
      'title':title,
      'colors':color,
      'sizes':size,
    };
  }
}
