import 'package:flutter/material.dart';

import '../../backend/backend_services.dart';
import '../../main.dart';
import '../../urls.dart';
import '../home.dart';
import '../widgets/auth_text_field.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final BackendServices _backendServices = BackendServices();

  signUPMethod() async {
    var result = await _backendServices.postRequest(
      signUpUrl,
      {
        "username": _username.text,
        "email": _email.text,
        "password": _password.text,
      },
    );
    if (result['status'] == "success") {
      await sharedPreferences.setInt("id", result['data']['id']);
      await sharedPreferences.setString("username", result['data']['username']);
      await sharedPreferences.setString("email", result['data']['email']);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    "assets/moment_sharing.png",
                    fit: BoxFit.fill,
                  ),
                ),
                AuthTextField(hentText: "UserName", controller: _username),
                AuthTextField(hentText: "Email", controller: _email),
                AuthTextField(hentText: "Password", controller: _password),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: signUPMethod(),
                      child: const Text("Sign up"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LogInScreen()));
                        },
                        child: const Text("Log in?"))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
