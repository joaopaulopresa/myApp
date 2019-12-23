import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Function signIn;

  Login(this.signIn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
      onPressed: () => signIn(),
      child: const Text('Entrar com o Google', style: TextStyle(fontSize: 20)),
    )));
  }
}