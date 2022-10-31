import 'package:flutter/material.dart';

import './theme_mode_selection_page.dart';
import 'utils/theme_mode.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    loadThemeMode().then((val) => setState(() => themeMode = val));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text('Dark/Light Mode'),
          trailing: Text((themeMode == ThemeMode.system)
              ? 'System'
              : (themeMode == ThemeMode.dark ? 'Dark' : 'Light')),
          onTap: () async {
            var ret = await Navigator.of(context).push<ThemeMode>(
              MaterialPageRoute(
                builder: (context) =>
                    ThemeModeSelectionPage(initThemeMode: themeMode),
              ),
            );
            setState(() => themeMode = ret!);
            await saveThemeMode(themeMode);
          },
        ),
      ],
    );
  }
}
