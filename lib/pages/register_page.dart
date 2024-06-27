import 'package:flipkart/components/my_button.dart';
import 'package:flipkart/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confrimPasswordController = TextEditingController();
  final addressController = TextEditingController();

  void signUserUp() async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(),);
    });

    try{
      Navigator.pop(context);
      if(passwordController.text==confrimPasswordController.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);}
      else{
        
        otherError("Passwords don't match");
      }
      
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      otherError(e.code);
    }
    catch(e){
      otherError(e.toString());
    }
  }

  void otherError(String message){
    showDialog(context: context, builder: (context){
      return  AlertDialog(backgroundColor: Colors.purple, title: Text(message),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 145, 209, 243),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                //logo
                const Icon(
                  Icons.shopping_cart,
                  size: 80,
                ),
                const SizedBox(
                  height: 30,
                ),
                //username
                MyTextField(
                    hintText: "Email",
                    isObscure: false,
                    controller: emailController),
                //password textfield
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: "Address",
                  isObscure: false,
                  controller: addressController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: "Password",
                  isObscure: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: "Confirm Password",
                  isObscure: true,
                  controller: confrimPasswordController,
                ),
                //sign in button
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: signUserUp,
                  text: "Sign Up",
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?", style: TextStyle(color: Color.fromARGB(255, 68, 67, 67),fontWeight: FontWeight.bold),),
                    const SizedBox(width: 4,),
                    GestureDetector(onTap: widget.onTap, child: const Text("Login Now", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
