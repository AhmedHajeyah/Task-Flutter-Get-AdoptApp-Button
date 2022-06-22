import 'package:adopt_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/auth_providers.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Username",
              ),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Password",
              ),
              controller: passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthProviders>().signUp(User(
                    username: usernameController.text,
                    password: passwordController.text));
                Navigator.popUntil(context, (route) {
                  return route.isFirst;
                });
              },
              child: const Text("Signup"),
            ),
          ],
        ),
      ),
    );
  }
}
