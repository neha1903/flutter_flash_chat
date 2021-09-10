import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/custom_widgets/custom_button.dart';
import 'package:flash_chat/custom_widgets/custom_text_field.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: Hero(
                    // This is an animation Hero Animation uses only tag to identify the start and begin this is an end Hero Tag Animation
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                CustomTextField(
                  hintText: "Enter your Email Here...",
                  onChange: (value) {
                    email = value;
                  },
                  hintTextColor: Colors.grey,
                  textColor: Colors.black,
                  borderColor: Colors.lightBlueAccent,
                  isPassword: false,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  hintText: "Enter your Password",
                  onChange: (value) {
                    password = value;
                  },
                  hintTextColor: Colors.grey,
                  textColor: Colors.black,
                  borderColor: Colors.lightBlueAccent,
                  isPassword: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 40.0,
                ),
                CustomButton(
                  label: 'Log In',
                  color: Colors.lightBlueAccent,
                  onPress: () async {
                    setState(() {
                      login();
                    });
                    //Do a login.
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    showSpinner = true;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential != null) {
        setState(() {
          showSpinner = false;
        });
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } on FirebaseAuthException catch (e) {
      showSpinner = false;
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      showSpinner = false;
      print(e);
    }
  }
}
