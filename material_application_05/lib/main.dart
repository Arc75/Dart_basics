import 'package:flutter/material.dart';
import 'scaffold_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScaffoldExample(title: "AAA"));
  }
}

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ScaffoldExample> createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  var tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  //PersistentBottomSheetController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('The App Bar title'),
        centerTitle: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.person)),
          )
        ],
      ),
      drawer: Helper.getLeftDrawer(),
      endDrawer: Helper.getEndDrawer()
    );
  }
}
