import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('الإحصائيات'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(child: _stat(context, Icons.folder, '47', 'ملف', theme.colorScheme.primary)),
              const SizedBox(width: 10),
              Expanded(child: _stat(context, Icons.functions, '478', 'دالة', Colors.cyan)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _stat(context, Icons.hub, '99', 'علاقة', Colors.orange)),
              const SizedBox(width: 10),
              Expanded(child: _stat(context, Icons.api, '155', 'endpoint', Colors.green)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stat(BuildContext context, IconData icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
