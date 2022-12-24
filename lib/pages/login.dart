import 'package:bloc_app/drawers/nav_drawer.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      drawer: const NavigationDrawer(),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Other page'),
          onPressed: () => {},
        ),
      ),
    );
  }
}