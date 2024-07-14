import 'package:chatapp2/Screens/ChatPage.dart';
import 'package:chatapp2/Screens/Signup.dart';
import 'package:chatapp2/Widgets.dart/CustomTextfield.dart';
import 'package:chatapp2/Widgets.dart/cutombutton.dart';
import 'package:chatapp2/Widgets.dart/showsnackbar.dart';
import 'package:chatapp2/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  Login({super.key});
  static String id = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kprimarycolor,
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Image.asset(
                  "assets/images/scholar.png",
                  height: 150,
                  width: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Scolar Chat",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                Customtextfield(
                  "Email",
                  onchanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Customtextfield(
                  "password",
                  obsecuretext: true,
                  onchanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton("Login", () async {
                  try {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      await signuser();
                      createsnackbar(context, "Successful Login");
                      Navigator.pushReplacementNamed(context, ChatPage.id,arguments: email);
                    }
                    isloading = false;
                    setState(() {});
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      createsnackbar(context, 'No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      createsnackbar(
                          context, 'Wrong password provided for that user.');
                    }
                  } catch (e) {
                    createsnackbar(context, "There is an error");
                  }
                  isloading = false;
                    setState(() {});
                }),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "dont have an account?  ",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignUp.id);
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> signuser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
