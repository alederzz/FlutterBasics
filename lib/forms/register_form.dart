import 'package:bloc_app/styles/input_style.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final _formKey = GlobalKey<FormState>();

  Future<void> _popUp(BuildContext context, {
    required String username,
    required String fullname,
    required String email,
    required String password,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hola'),
          content: Column(
            children: [
              Text(username),
              Text(fullname),
              Text(email),
              Text(password)
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    String? username;
    String? fullName;
    String? email;
    String? password;


    return Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputStyle.defaultStyle(
                    icon: Icons.alternate_email,
                    hintText: 'Username',
                    helperText: 'Not use space, only alphabet and numbers.',
                  ),
                  onSaved: (String? value) { username = value; },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  decoration: InputStyle.defaultStyle(
                    hintText: 'Full name',
                    icon: Icons.person
                  ),
                  onSaved: (value) => fullName = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputStyle.defaultStyle(
                    hintText: 'Email',
                    icon: Icons.email
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  obscureText: true,
                  decoration: InputStyle.defaultStyle(
                    hintText: 'Password',
                    icon: Icons.lock
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      _formKey.currentState!.save();
                      print(fullName);
                      _popUp(context,
                      username: username,
                      fullname: fullName,
                      email: email,
                      password: password);
                    }
                  },
                  child: const Text('Registro')
                )
              ],
            ),
          );
  }
}