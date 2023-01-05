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
              Navigator.pushReplacementNamed(context, '/');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue[500]
            ),
          ),
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/counter');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue[500]
            ),
          ),
          ListTile(
            title: const Text('Cards'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/cards');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue[500]
            ),
          ),
          ListTile(
            title: const Text('Form Example'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/form_example');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue[500]
            ),
          ),
          ListTile(
            title: const Text('Shared Preferences'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/shared_preferences');
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