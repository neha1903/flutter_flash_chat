import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/custom_widgets/custom_button.dart';
import 'package:flash_chat/custom_widgets/custom_text_field.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

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
                  borderColor: Colors.blueAccent,
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
                  borderColor: Colors.blueAccent,
                  isPassword: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 40.0,
                ),
                CustomButton(
                  label: 'Register',
                  color: Colors.blueAccent,
                  onPress: () async {
                    setState(() {
                      register();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    showSpinner = true;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        setState(() {
          showSpinner = false;
        });
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } on FirebaseAuthException catch (e) {
      showSpinner = false;
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      showSpinner = false;
      print(e);
    }
  }
}
