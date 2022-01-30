import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = List.generate(100, (index) {
    return SimpleCard(index: index.toString());
  });

  var controller = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView(
              controller: controller,
              children: data.map((e) => e).toList(),
            ))
          ],
        ),
      ),
    );
  }
}

class SimpleCard extends StatefulWidget {
  SimpleCard({Key key, this.index}) : super(key: key);
  final String index;

  @override
  SimpleCardState createState() => SimpleCardState();
}

class SimpleCardState extends State<SimpleCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: ListTile(
            trailing: Icon(Icons.favorite,
                color: isFavorite ? Colors.red[600] : Colors.black12),
            title: Text(widget.index),
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            }),
      ),
    );
  }
}
