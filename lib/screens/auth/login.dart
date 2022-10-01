import 'package:flutter/material.dart';

import '../home.dart';
import '../widgets/auth_text_field.dart';
import 'signup.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
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
                AuthTextField(hentText: "Email", controller: _email),
                AuthTextField(hentText: "Password", controller: _password),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Text("Log in")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text("Sign up?"))
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
