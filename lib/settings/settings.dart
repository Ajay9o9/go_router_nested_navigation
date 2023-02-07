import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body:  Container(
        color: Colors.pink,
        child: const Padding(
          padding: EdgeInsets.all(28.0),
          child: Center(child: Text("Settings")),
        ),
      ),
    );
  }
}
