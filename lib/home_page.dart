import 'package:flutter/material.dart';
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Card(
      child: Column(
      mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.check),
            title: Text('TITLE'),
            subtitle: Text('SUBTITLE'),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                child: const Text('BTN1'),
                onPressed: () {/* ... */},
              ),
              TextButton(
                child: const Text('BTN2'),
                onPressed: () {/* ... */},
              ),
            ],
          ),
        ],
      ),
      ),
        ],
      ),
    );
  }
}
