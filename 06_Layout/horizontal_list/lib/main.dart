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
  //var data = List.generate(50, (index) => index);
  var data = List.generate(100, (index) {
    return SimpleCard(index: index.toString());
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        /* Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints contrainst) {
              var _width = contrainst.constrainWidth();
              print(_width);
              return _width > contrainst.maxWidth
                  ? _getGridView(_width > contrainst.maxWidth)
                  : _getListView();
            },
          ),
        ), */
        Expanded(child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _getGridView(orientation == Orientation.portrait)
              : _getListView();
        })),
      ],
    ));
  }

  Widget _getGridView(isHorizontal) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isHorizontal ? 3 : 2,
          childAspectRatio: isHorizontal? 2 : 1,
        ),
          itemCount: data.length, itemBuilder: (context, index) => data[index]),
    );
  }

  Widget _getListView() {
    return Container(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => data[index]));
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
            //trailing: Icon(Icons.favorite,         color: isFavorite ? Colors.red[600] : Colors.black12),
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
