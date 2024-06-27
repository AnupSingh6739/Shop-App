import 'package:flipkart/components/my_button.dart';
import 'package:flipkart/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(),);
    });

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      otherError(e.code);
    }
    catch(e){
      otherError(e.toString());
    }
  }

//   Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

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
                  height: 15,
                ),
                //logo
                const Icon(
                  Icons.shopping_cart,
                  size: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                //welcome back
                const Text(
                  "Welcome back! You have been missed",
                  style: TextStyle(
                    color :Color.fromARGB(255, 68, 67, 67),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                  hintText: "Password",
                  isObscure: true,
                  controller: passwordController,
                ),
                //forgot password?
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Color.fromARGB(255, 68, 67, 67),fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                //sign in button
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: signUserIn,
                  text: "Sign In",
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?", style: TextStyle(color: Color.fromARGB(255, 68, 67, 67),fontWeight: FontWeight.bold),),
                    const SizedBox(width: 4,),
                    GestureDetector(onTap: widget.onTap, child: const Text("Register Now", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),))
                  ],
                )
                //not a member?register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
