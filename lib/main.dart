import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/stats_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AIDevApp());
}

class AIDevApp extends StatefulWidget {
  const AIDevApp({super.key});
  @override
  State<AIDevApp> createState() => _AIDevAppState();
}

class _AIDevAppState extends State<AIDevApp> {
  bool _isDark = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _isDark = prefs.getBool('dark') ?? true);
  }

  void _toggle() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark', !_isDark);
    setState(() => _isDark = !_isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Dev Studio',
      debugShowCheckedModeBanner: false,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8054DF),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF08080F),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8054DF),
        ),
      ),
      home: MainScreen(isDark: _isDark, onToggle: _toggle),
    );
  }
}

class MainScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggle;
  const MainScreen({super.key, required this.isDark, required this.onToggle});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _idx,
        children: [
          const HomeScreen(),
          const StatsScreen(),
          SettingsScreen(isDark: widget.isDark, onToggle: widget.onToggle),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _idx,
        onDestinationSelected: (i) => setState(() => _idx = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'إحصائيات'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'إعدادات'),
        ],
      ),
    );
  }
}
