
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  final Function signOut;

  Inicio(this.signOut);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              tooltip: 'Logout',
              onPressed: () => signOut(),
            )
          ]),
        body: Center(
            child: Text('Olá\nUsuário', style: TextStyle(fontSize: 20))));
  }
}