import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField ({super.key, required this.controller, required this.isObscure, required this.hintText});
  final TextEditingController controller;
  final bool isObscure;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  style: const TextStyle(color: Color.fromARGB(255, 68, 67, 67), fontWeight: FontWeight.bold, fontSize: 20),
                  obscureText: isObscure,
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)
                    ),
                    fillColor: const Color.fromRGBO(245, 247, 249, 1),
                    filled: true,
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 68, 67, 67),) ,
                  ),
                ),
              );
  }
}