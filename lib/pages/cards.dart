import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                    leading: Icon(Icons.person_pin),
                    title: Text('A custom title card with buttons'),
                    subtitle: Text('Custom description for card'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => {},
                        child: const Text('Buy')
                      ),
                      TextButton(
                        onPressed: () => {},
                        child: const Text('Buy')
                      ),
                    ],
                  )
                ],
              ),
            ),
            Card(
              child: InkWell(
                onTap: () => {},
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person_pin),
                      title: Text('A custom title card'),
                      subtitle: Text('Custom description for card'),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: InkWell(
                onLongPress: () => {},
                child: Column(
                  children: const [
                    ListTile(
                      dense: true,
                      horizontalTitleGap: 0.0,
                      leading: Icon(Icons.person_pin),
                      title: Text('A custom card dense'),
                      subtitle: Text('Custom description for card'),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Row(
                children: const [
                  Expanded(
                    child: ListTile(
                      dense: true,
                      horizontalTitleGap: 0.0,
                      title: Text('Card with image'),
                      subtitle: Text('A custom description for card with image'),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                        child: Image(
                            image: AssetImage('assets/ardilla.png')
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: const [
                  Expanded(
                    child: ListTile(
                      dense: true,
                      horizontalTitleGap: 0.0,
                      title: Text('Card with image'),
                      subtitle: Text('A custom card image with padding'),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.pink
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                      child: Image(
                        width: 62.0,
                        image: AssetImage('assets/ardilla.png')
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4.0),
                      bottom: Radius.circular(4.0)
                ),
                child: Column(
                  children: const [
                    Image(
                        image: AssetImage('assets/arrecife.jpg'),
                    ),
                    Acordeon()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100.00,
            )
          ],
        ),
      ),
    );
  }
}

class Acordeon extends StatefulWidget {
  const Acordeon({ Key? key, }) : super(key: key);

  @override
  State<Acordeon> createState() => _AcordeonState();
}

class _AcordeonState extends State<Acordeon> {

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _expanded = !_expanded;
        });
      },
      expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 0.0),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) => const ListTile( title: Text('Card with Accordeon'),),
          body: const ListTile(
            subtitle: Text('Hello World!!'),
          ),
          isExpanded: _expanded
        )
      ],
    );
  }
}