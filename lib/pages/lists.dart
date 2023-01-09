import 'package:bloc_app/lists/dynamic_list.dart';
import 'package:bloc_app/lists/simple_list.dart';
import 'package:bloc_app/lists/sliver_list.dart';
import 'package:flutter/material.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const SimpleList()))
              ),
              child: const Text('Simple List')
            ),
            const SizedBox(height: 25.0,),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const DynamicList()))
              ),
              child: const Text('Dynamic List')
            ),
            const SizedBox(height: 25.0,),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const SliverListPage()))
              ),
              child: const Text('Sliver List')
            ),
          ],
        ),
      ),
    );
  }
}