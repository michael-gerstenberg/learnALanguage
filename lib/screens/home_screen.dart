import 'package:flutter/material.dart';
import 'package:penis/widgets/flip_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map boxes = {
    'Smalltalk': [
      {'v': 'vorne1', 'b': 'hinte333n1'},
      {'v': 'vordne1', 'b': 'hin55ten1'},
      {'v': 'vorndve1', 'b': 'hinweten1'},
      {'v': 'vornsse1', 'b': 'hweinten1'},
    ],
    'Business': [
      {'v': 'vordne2', 'b': 'hintcdven2'},
      {'v': 'vornase2', 'b': 'hin  ten2'},
      {'v': 'vorssne2', 'b': 'hindfeten2'},
      {'v': 'vorffffne2', 'b': 'h   finten2'},
      {'v': 'vorn4444e2', 'b': 'hieenten2'},
    ]
  };
  int _selectedIndex = 0;
  List _selectedItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedItems = boxes.values.elementAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedItems = boxes.values.elementAt(0);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Learn Thai'),
      ),
      body: Column(children: [
        for (Map item in _selectedItems)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlipAnimation(
                Card(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(item['v']),
                  width: MediaQuery.of(context).size.width * 0.9,
                )),
                Card(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(item['b']),
                  width: MediaQuery.of(context).size.width * 0.9,
                ))),
          )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (var navTitle in boxes.keys)
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_new_outlined), label: navTitle),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
