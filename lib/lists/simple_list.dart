import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  const SimpleList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple list'),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {

            final image = (index % 3 == 0)
              ? 'assets/ardilla.png'
              : 'assets/panda.png';

            return Card(
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 1000),
                      content: Text('Has selected ${index + 1}')
                    )
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        dense: true,
                        horizontalTitleGap: 0.0,
                        title: Text('Card with image ${index + 1}'),
                        subtitle: const Text('A custom card image with padding'),
                      ),
                    ),
                    SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.blue
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                        child: Image.asset(image)
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}