import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/theme_mode.dart';

class ThemeModeSelectionPage extends StatefulWidget {
  const ThemeModeSelectionPage({super.key, required this.initThemeMode});

  final ThemeMode initThemeMode;

  @override
  State<ThemeModeSelectionPage> createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState extends State<ThemeModeSelectionPage> {
  ThemeMode currentThemeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    currentThemeMode = widget.initThemeMode;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, themeMode, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () =>
                      Navigator.pop<ThemeMode>(context, currentThemeMode),
                ),
              ),
              RadioListTile<ThemeMode>(
                value: ThemeMode.system,
                groupValue: currentThemeMode,
                title: const Text('System'),
                onChanged: (val) => {
                  setState(() => currentThemeMode = val!),
                  themeMode.update(val!),
                },
              ),
              RadioListTile<ThemeMode>(
                value: ThemeMode.dark,
                groupValue: currentThemeMode,
                title: const Text('Dark'),
                onChanged: (val) => {
                  setState(() => currentThemeMode = val!),
                  themeMode.update(val!),
                },
              ),
              RadioListTile<ThemeMode>(
                value: ThemeMode.light,
                groupValue: currentThemeMode,
                title: const Text('Light'),
                onChanged: (val) => {
                  setState(() => currentThemeMode = val!),
                  themeMode.update(val!),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
