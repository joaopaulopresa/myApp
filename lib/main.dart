import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(title: 'My App'),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  String user;

  @override
  void initState() {
    super.initState();
    user = null;
  }

  void signOut() {
    setState(() {
      user = null;
    });
  }

  void signIn() {
    setState(() {
      user = 'user';
    });
  }

  @override
  Widget build(BuildContext context) {
    return user == null ? new Login(signIn) : new Inicio(signOut);
  }
}

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
