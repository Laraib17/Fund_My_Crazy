import 'package:flutter/material.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Emergency SOS Button
            GestureDetector(
              onTap: _triggerEmergencySOS,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Emergency SOS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 48),
            // Status Indicators
            _StatusIndicatorRow(
              label: 'Offline Hardware Listener',
              isActive: true, // Placeholder
              icon: Icons.hardware,
            ),
            const SizedBox(height: 16),
            _StatusIndicatorRow(
              label: 'Local AI Voice Listener',
              isActive: false, // Placeholder
              icon: Icons.mic_none,
            ),
            const SizedBox(height: 16),
            _StatusIndicatorRow(
              label: 'Location Services',
              isActive: true, // Placeholder
              icon: Icons.location_on,
            ),
          ],
        ),
      ),
    );
  }

  void _triggerEmergencySOS() {
    // TODO: Implement emergency SOS functionality
  }
}

class _StatusIndicatorRow extends StatelessWidget {
  final String label;
  final bool isActive;
  final IconData icon;

  const _StatusIndicatorRow({
    required this.label,
    required this.isActive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: isActive ? Colors.green : Colors.grey,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isActive ? Colors.green : Colors.grey[400],
            ),
          ),
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }
}
