import 'package:flutter/material.dart';
import 'inicio.dart';
import 'login.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

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
  GoogleSignInAccount account;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        this.account = account;
      });
    });
    user = null;
    _googleSignIn.signInSilently();
  }

   Future<void> googleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> googleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    return account == null ? new Login(googleSignIn) : new Inicio(googleSignOut);
  }
  
}
