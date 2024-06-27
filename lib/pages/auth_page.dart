import 'package:flipkart/shop_pages/featured_page.dart';
import 'package:flipkart/shop_pages/shoes_page.dart';
import 'package:flipkart/pages/login_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user is logged in
          if(snapshot.hasData){
            return const FeaturedPage();
          }
          else{
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}