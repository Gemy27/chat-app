import 'package:chatapp2/Screens/LoginPage.dart';
import 'package:chatapp2/Widgets.dart/CustomTextfield.dart';
import 'package:chatapp2/Widgets.dart/cutombutton.dart';
import 'package:chatapp2/Widgets.dart/showsnackbar.dart';
import 'package:chatapp2/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  static String id = "signup";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? email;

  String? password;

  bool isloading = false;

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
                  "Sign UP",
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
                  "Password",
                  obsecuretext: true,
                  onchanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton("Sign Up", () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      isloading = true;
                      setState(() {});
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email!, password: password!);
                      createsnackbar(
                          context, "The account created successfully");
                      Navigator.pushReplacementNamed(context, Login.id,
                          arguments: email);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        createsnackbar(
                            context, 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        createsnackbar(context,
                            'The account already exists for that email.');
                      }
                    } catch (e) {
                      createsnackbar(context, "There is an erorr");
                    }
                    isloading = false;
                    setState(() {});
                  }
                }),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account... ",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Login.id);
                      },
                      child: Text(
                        "Login",
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
}
