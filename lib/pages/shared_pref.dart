import 'package:bloc_app/forms/preference_form.dart';
import 'package:flutter/material.dart';

class SharedPref extends StatelessWidget {
  const SharedPref({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox( height: 50.0 ),
            PreferenceForm(keyField: 'name'),
            SizedBox( height: 40.0 ),
            PreferenceForm(keyField: 'email'),
          ],
        ),
      ),
    );
  }
}
