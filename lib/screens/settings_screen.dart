import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggle;
  const SettingsScreen({super.key, required this.isDark, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات'), centerTitle: true),
      body: ListView(
        children: [
          SwitchListTile(
            secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            title: const Text('الوضع الداكن'),
            value: isDark,
            onChanged: (_) => onToggle(),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('الإصدار'),
            subtitle: Text('1.0.0'),
          ),
          const ListTile(
            leading: Icon(Icons.code),
            title: Text('Built with'),
            subtitle: Text('GitHub Actions'),
          ),
        ],
      ),
    );
  }
}
