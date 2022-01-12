import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> nav = ['Список 1', 'Список 2'];
  final List fakeData = List.generate(100, (index) => index.toString());

  Map<String, dynamic> picturesMap = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: picturesMap.values.length,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Homework example'),
              bottom: TabBar(
                tabs: picturesMap.keys
                    .map((String item) => Tab(text: item))
                    .toList(),
              )),
          body: TabBarView(
            children: picturesMap.keys.map((name) {
              return CarouselSlider(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.4,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    pageViewKey: PageStorageKey(name),
                    scrollDirection: Axis.vertical),
                items: picturesMap[name].map<Widget>((i) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      decoration:
                          BoxDecoration(color: Colors.blueGrey.shade100),
                      child: Image.network(i));
                }).toList(),
              );
            }).toList(),
          ),
        ));
  }
}
