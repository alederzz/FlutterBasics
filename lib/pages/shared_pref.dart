import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatelessWidget {
  const SharedPref({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 50.0,
          ),
          SaveNameForm(),
          SizedBox(
            height: 45,
          )
        ],
      ),
    );
  }
}

class SaveNameForm extends StatefulWidget {
  const SaveNameForm({ Key? key, }) : super(key: key);

  @override
  State<SaveNameForm> createState() => _SaveNameFormState();
}

class _SaveNameFormState extends State<SaveNameForm> {

  final fieldNameController = TextEditingController();
  late Future<String> _name;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _name = _prefs.then((SharedPreferences prefs) => prefs.getString('name') ?? 'TEXT DATA');
  }


  @override
  void dispose() {
    fieldNameController.dispose();
    super.dispose();
  }

  void _setNewName() async {
    final prefs = await _prefs;

    setState(() {
      _name = prefs.setString('name', fieldNameController.text)
              .then((bool success) => fieldNameController.text);

    });
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children: [
          TextField(
            controller: fieldNameController,
            decoration: const InputDecoration(
              hintText: 'Escribre tu nombre',
              label: Text('Nombre')
            ),
           ),
          ElevatedButton(
            onPressed: _setNewName,
            child: const Text('Guardar')
          ),
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
    );
  }
}
