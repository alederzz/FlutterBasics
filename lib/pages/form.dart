import 'package:flutter/material.dart';

class FormExample extends StatelessWidget {
  const FormExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              icon: Icon( Icons.alternate_email ),
              hintText: 'Username',
              helperText: 'Not use space, only alphabet and numbers.',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.yellow
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.pinkAccent,
                  width: 2
                )
              )
            ),
          ),
          TextField(
            decoration: InputDecoration(
              icon: Icon( Icons.person ),
              hintText: 'Full name'
            ),
          ),
          TextField(
            decoration: InputDecoration(
              icon: Icon( Icons.email ),
              labelText: 'Email',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.yellow
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.pinkAccent,
                  width: 2
                )
              )
            ),
          )
        ],
      ),
    );
  }
}