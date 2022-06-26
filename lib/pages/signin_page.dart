import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Center(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Username",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthProviders>().signUp(User(
                      username: usernameController.text,
                      password: passwordController.text,
                    ));
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
