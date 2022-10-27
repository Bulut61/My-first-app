import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes/app_router.gr.dart';
import '../widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //backgroundColor: Colors.blue,
      body: Column(
        children: [
          SizedBox(height: 25),
          Center(child: Text("Welcome", style: GoogleFonts.bebasNeue(fontSize: 52, color: Colors.black))),
          SizedBox(height: 25),

          // Email inputfield
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email'),
          ),
          SizedBox(height: 15),

          // password
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'password'),
          ),
          SizedBox(height: 15),
          //confirm password input field
          TextField(
            controller: _confirmController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Confirm email'),
          ),
          SizedBox(height: 15),

          // firstname input field
          TextField(
            controller: _firstNameController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'firstname'),
          ),
          SizedBox(height: 15),

          //lastname input field
          TextField(
            controller: _lastNameController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'lastname'),
          ),
          SizedBox(height: 15),
          CustomButton(
            onPressed: () {
              if (isOneFieldInvalid()) {
                showInformationDialog(context);
              }
              context.router.pop();
            },
            text: "Sign up",
            buttonColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController = TextEditingController();
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(showInvalidInput()),
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Okay'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  String showInvalidInput() {
    if (_emailController.text.isEmpty) {
      return "Email field is empty";
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text)) {
      return "invalid email format";
    } else if (_passwordController.text.isEmpty) {
      return "Password field is empty";
    } else if (_confirmController.text != _passwordController.text) {
      return "confirmed password is wrong try again";
    } else if (_firstNameController.text.isEmpty) {
      return "firstname field is empty";
    } else if (_lastNameController.text.isEmpty) {
      return "lastname field is empty";
    }
    return "ok";
  }

  bool isOneFieldInvalid() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _confirmController.text != _passwordController.text || _firstNameController.text.isEmpty || _lastNameController.text.isEmpty) {
      return true;
    }
    return false;
  }
}
