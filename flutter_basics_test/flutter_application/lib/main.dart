import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter basics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter test page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final images = getImages();  

  static List<Widget> getImages() {
      final sources = [
        'https://stackoverflow.design/assets/img/logos/so/logo-ru.svg',
        'https://stackoverflow.design/assets/img/logos/so/logo-meta.svg',
        'https://stackoverflow.design/assets/img/logos/so/logo-stackoverflow.svg'
      ];

      final result = List<Widget>.empty(growable: true);

      for (var source in sources) {
        result.add(SvgPicture.network(
          source,
          semanticsLabel: 'A shark?!',
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ));
      }

      return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/iconmonstr-stackoverflow-2.png'),
            SvgPicture.network(
                'https://stackoverflow.design/assets/img/logos/so/logo-stackoverflow.svg',
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator())),
            CarouselSlider(
              options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber.shade100),
                        child: i
                        );
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }  
}
