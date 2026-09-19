import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Placeholder state for toggles and text field
  String _secretPhrase = 'tree on mars';
  bool _antiPowerOffEnabled = true;
  bool _locationBroadcastingEnabled = true;

  void _openAccessibilitySettings() {
    // TODO: Implement opening system accessibility settings
    // This would require platform-specific code (e.g., using android_intent or url_launcher)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings & Configuration'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          // Secret Voice Phrase Input
          const Text(
            'Secret Voice Phrase (Online Mode)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your secret voice phrase',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                _secretPhrase = value;
              });
            },
          ),
          const SizedBox(height: 32),
          // Toggles Section
          const Text(
            'Features',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          _ToggleTile(
            title: 'Anti-Power-Off Protection Lock',
            subtitle: 'Prevents device from being turned off during emergencies',
            isOn: _antiPowerOffEnabled,
            onChanged: (value) {
              setState(() {
                _antiPowerOffEnabled = value;
              });
            },
          ),
          const SizedBox(height: 16),
          _ToggleTile(
            title: 'Location Broadcasting',
            subtitle: 'Share real-time location with emergency contacts',
            isOn: _locationBroadcastingEnabled,
            onChanged: (value) {
              setState(() {
                _locationBroadcastingEnabled = value;
              });
            },
          ),
          const SizedBox(height: 32),
          // Accessibility Settings Button
          ElevatedButton.icon(
            onPressed: _openAccessibilitySettings,
            icon: const Icon(Icons.accessibility),
            label: const Text('Open Accessibility Settings'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isOn;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.title,
    this.subtitle,
    required this.isOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        titleTextStyle: const TextStyle(color: Colors.white),
        subtitleTextStyle: TextStyle(color: Colors.grey[400]),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: Switch(
          value: isOn,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}