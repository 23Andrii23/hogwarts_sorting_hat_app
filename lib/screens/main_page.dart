import 'package:flutter/material.dart';
import 'package:hogwarts/screens/home_screen/home_screen.dart';
import 'package:hogwarts/screens/list_screen/list_screen.dart';
import 'package:hogwarts/widgets/stats_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Home Screen' : 'List Screen'),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: StatsCard(count: 4, title: 'Total'),
                  ),
                  Expanded(
                    child: StatsCard(count: 3, title: 'Success'),
                  ),
                  Expanded(
                    child: StatsCard(count: 1, title: 'Failed'),
                  ),
                ],
              ),
            ),
            _bodyWidget[_selectedIndex],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
      ),
    );
  }

  final List<Widget> _bodyWidget = const [
    HomeScreen(),
    ListScreen(),
  ];
}
