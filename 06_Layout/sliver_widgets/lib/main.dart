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
  String _text = "";

  @override
  void initState() {
    super.initState();
    loadAsset().then((String result) {
      setState(() {
        _text = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        expandedHeight: 160,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('SliverAppBar'),
          background: FlutterLogo(),
        ),
      ),
      SliverToBoxAdapter(
        child: Text(_text),
      ),
    ]));
  }

  Future<String> loadAsset() async {
    try {
      return await DefaultAssetBundle.of(context)
          .loadString('assets/my_file.txt');
    } catch (ex) {
      throw ex;
    }
  }
}
