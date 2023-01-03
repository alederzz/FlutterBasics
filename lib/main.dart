import 'package:bloc_app/pages/cards.dart';
import 'package:bloc_app/pages/counter.dart';
import 'package:bloc_app/pages/form.dart';
import 'package:bloc_app/pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/counter': (context) => const Counter(title: 'New Flutter Counter'),
        '/cards': (context) => const Cards(),
        '/form_example': (context) => const FormExample(),
      },
      theme: ThemeData.dark(),
    );
  }
}
