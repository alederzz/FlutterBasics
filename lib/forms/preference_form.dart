import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferenceForm extends StatefulWidget {
  const PreferenceForm({ Key? key, required this.keyField }) : super(key: key);

  final String keyField;

  @override
  State<PreferenceForm> createState() => _PreferenceFormState();
}

class _PreferenceFormState extends State<PreferenceForm> {

  final fieldNameController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _name;


  @override
  void initState() {
    super.initState();
    _name = _prefs.then((SharedPreferences prefs) => prefs.getString(widget.keyField) ?? 'TEXT DATA');
  }


  @override
  void dispose() {
    fieldNameController.dispose();
    super.dispose();
  }

  void _setNewName() async {
    setState(() {

      if (fieldNameController.text.isNotEmpty) {
        _name = _prefs
          .then((SharedPreferences prefs) => prefs.setString(widget.keyField, fieldNameController.text))
          .then((bool success) {

            final String fieldNameValue = fieldNameController.text;

            fieldNameController.value = TextEditingValue.empty;

            FocusManager.instance.primaryFocus?.unfocus();

            return fieldNameValue;
          });
      } else {
        const snackBar = SnackBar(
          content: Text('The \'name\' field cannot be empty.'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    });
  }

  void _removeName() async {
    setState(() {

      fieldNameController.value = TextEditingValue.empty;

      _name = _prefs
        .then((SharedPreferences prefs) => prefs.remove(widget.keyField))
        .then((bool success) => 'TEXT DATA');

    });

    const snackBar = SnackBar(
      content: Text('Has removed "name" key.'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        child: Column(
          children: [
            TextField(
              controller: fieldNameController,
              decoration: const InputDecoration(
                hintText: 'What is your name?',
                label: Text('Name')
              ),
            ),
            const SizedBox( height: 12.0, ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _removeName,
                  style: ButtonStyle(
                    //backgroundColor: MaterialStateProperty.all(Colors.red),
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      // if state is pressed
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.orange;
                      }
                      return Colors.red;
                    }),
                  ),
                  child: const Text('Clear')
                ),
                const SizedBox(width: 10.0,),
                ElevatedButton(
                  onPressed: _setNewName,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)
                  ),
                  child: const Text('Save')
                ),
              ],
            ),
            const SizedBox( height: 40.0),
            FutureBuilder(
              future: _name,
              builder: (__, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('${snapshot.data}', style: const TextStyle( fontSize: 28, fontWeight: FontWeight.bold ));
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}



