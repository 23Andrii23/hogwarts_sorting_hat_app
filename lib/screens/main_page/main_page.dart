import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hogwarts/screens/home_screen/home_screen.dart';
import 'package:hogwarts/screens/list_screen/list_screen.dart';
import 'package:hogwarts/screens/main_page/controller/main_page.controller.dart';
import 'package:hogwarts/service/main_info.dart';
import 'package:hogwarts/widgets/stats_card.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mainPageState = ref.watch(mainPageControllerProvider);

    return mainPageState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text(error.toString())),
      data: (state) => Scaffold(
        appBar: AppBar(
          title: Text(_selectedIndex == 0 ? 'Home Screen' : 'List Screen'),
          backgroundColor: Colors.blue,
          actions: [
            TextButton(
              onPressed: () {
                MainInfo().fetchCharacters();
              },
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: StatsCard(
                        count: state.totalAttempts,
                        title: 'Total',
                      ),
                    ),
                    Expanded(
                      child: StatsCard(
                        count: state.successAttempts,
                        title: 'Success',
                      ),
                    ),
                    Expanded(
                      child: StatsCard(
                        count: state.failedAttempts,
                        title: 'Failed',
                      ),
                    ),
                  ],
                ),
              ),
              _bodyWidget[_selectedIndex],
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
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
      ),
    );
  }

  final List<Widget> _bodyWidget = const [
    HomeScreen(),
    ListScreen(),
  ];
}
