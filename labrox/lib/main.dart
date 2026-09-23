import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_dashboard.dart';
import 'screens/trusted_contacts.dart';
import 'screens/settings.dart';

void main() {
  runApp(const RakshaApp());
}

class RakshaApp extends StatelessWidget {
  const RakshaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raksha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: google_fonts.bebasNeue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E293B), // Deep Slate/Blue base
          primary: const Color(0xFF3B82F6), // Trustworthy Blue
          secondary: const Color(0xFF10B981), // Reassuring Green
          error: const Color(0xFFEF4444), // Emergency Crimson Red
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Color(0xFF0F172A),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ).copyWith(
          background: const Color(0xFF121212),
          surface: const Color(0xFF1E1E1E),
          primary: const Color(0xFFDC2626),
          secondary: const Color(0xFFFB923C),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeDashboard(),
    TrustedContactsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rakshak"),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 184, 248, 111),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/drawer2.svg',
            ),
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 184, 248, 111),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/drawer2.svg',
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Contacts',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton.extended(
              onPressed: _addContact,
              label: const Text('Add Contact'),
              icon: const Icon(Icons.person_add),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            )
          : null,
    );
  }

  void _addContact() {
    // TODO: Implement add contact functionality
  }
}
//color scheame soft green(#98FB98), clean blue (#0099FF )
