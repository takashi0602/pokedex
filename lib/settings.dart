import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: const [
            Icon(
              Icons.settings,
              size: 32,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text('Settings', style: TextStyle(fontSize: 36)),
            )
          ],
        ));
  }
}
