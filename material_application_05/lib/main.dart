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

class _ScaffoldExampleState extends State<ScaffoldExample>
    with TickerProviderStateMixin {
  var tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;
  TabController? _tabController;
  int _currentTabIndex = 0;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _currentTabIndex = _tabController!.index;
      });
    });
  }

  void toggleBottomSheet() {
    if (_controller == null) {
      _controller =
          scaffoldKey.currentState!.showBottomSheet((context) => Container(
                color: Colors.blue[400],
                height: 300,
                child: Center(
                  child: Text('Bottom sheet'),
                ),
              ));
    } else {
      _controller!.close();
      _controller = null;
    }
  }

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
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.cyan,
            child: Text('Tab1'),
          ),
          Container(
            color: Colors.orange,
            child: Text('Tab2'),
          ),
          Container(
            color: Colors.indigo,
            child: Text('Tab3'),
          ),
        ],
      ),
      drawer: Helper.getLeftDrawer(),
      endDrawer: Helper.getEndDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.backup), label: 'Backup'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), label: 'Assessment'),
        ],
        onTap: (i) {
          setState(() {
            _tabController!.index = i;
            _currentTabIndex = i;
          });
        },
        currentIndex: _currentTabIndex,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: toggleBottomSheet,
          backgroundColor: Colors.blue[400],
          child: const Icon(Icons.navigation)),
    );
  }
}