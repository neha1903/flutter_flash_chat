import 'package:flash_chat/custom_widgets/custom_button.dart';
import 'package:flash_chat/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                // This is an animation Hero Animation uses only tag to identify the start and begin this is an end Hero Tag Animation
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              CustomTextField(
                hintText: "Enter your Email Here...",
                onChange: (value) {
                  print(value);
                  //Do something with the user input.
                },
                hintTextColor: Colors.grey,
                textColor: Colors.black,
                borderColor: Colors.blueAccent,
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                hintText: "Enter your Password",
                onChange: (value) {
                  print(value);
                  //Do something with the user input.
                },
                hintTextColor: Colors.grey,
                textColor: Colors.black,
                borderColor: Colors.blueAccent,
              ),
              SizedBox(
                height: 40.0,
              ),
              CustomButton(
                label: 'Register',
                color: Colors.blueAccent,
                onPress: () {
                  //Do a login.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
