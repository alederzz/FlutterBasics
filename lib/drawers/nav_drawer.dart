import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            child: Text('title'),
          ),
          ListTile(
            title: const Text('Login Page'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue[500]
            ),
          ),
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/counter');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue[500]
            ),
          ),
          ListTile(
            title: const Text('Cards'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/cards');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue[500]
            ),
          ),
          ListTile(
            title: const Text('Form Example'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/form_example');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue[500]
            ),
          ),
          ListTile(
            title: const Text('Shared Preferences'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/shared_preferences');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue[500]
            ),
          ),
        ],
      ),
    );
  }
}