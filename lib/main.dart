import 'package:flutter/material.dart';

import './poke_list.dart';
import './settings.dart';
import 'utils/theme_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    loadThemeMode().then((val) => setState(() => themeMode = val));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Flutter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: const TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentBottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: currentBottomNavigationIndex == 0
            ? const PokeList()
            : const Settings(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(() => {currentBottomNavigationIndex = index})
        },
        currentIndex: currentBottomNavigationIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
