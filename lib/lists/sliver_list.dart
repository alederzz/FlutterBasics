import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Sample text'),
            expandedHeight: 240.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/profundo.jpg', fit: BoxFit.fill),
            ),
            centerTitle: true,
            pinned: true,
            snap: false,
            floating: true,
            elevation: 0,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(title: Text('Item #$index'));
              },
              childCount: 40
            ),
          ),
        ],
      ),
    );
  }
}