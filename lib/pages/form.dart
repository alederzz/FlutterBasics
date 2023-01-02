import 'package:bloc_app/forms/register_form.dart';
import 'package:flutter/material.dart';

class FormExample extends StatelessWidget {
  const FormExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: const RegisterForm(),
        ),
      ),
    );
  }
}