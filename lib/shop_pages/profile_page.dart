import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void signOut() async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          GestureDetector(onTap: signOut,child: const Center(child: Icon(Icons.logout, size: 40,))),
          GestureDetector(onTap: signOut, child: const Center(child: Text("Logout", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),))),
        ],
      )
    );
  }
}