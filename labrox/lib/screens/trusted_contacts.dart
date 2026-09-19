import 'package:flutter/material.dart';

class TrustedContactsScreen extends StatefulWidget {
  const TrustedContactsScreen({super.key});

  @override
  State<TrustedContactsScreen> createState() => _TrustedContactsScreenState();
}

class _TrustedContactsScreenState extends State<TrustedContactsScreen> {
  // Sample data - in a real app, this would come from a local database or state management
  final List<Map<String, String>> _contacts = [
    {
      'name': 'Emergency Contact 1',
      'phone': '+1 (555) 123-4567',
      'relationship': 'Mother',
    },
    {
      'name': 'Emergency Contact 2',
      'phone': '+1 (555) 987-6543',
      'relationship': 'Father',
    },
    {
      'name': 'Emergency Contact 3',
      'phone': '+1 (555) 456-7890',
      'relationship': 'Best Friend',
    },
  ];

  void _addContact() {
    // TODO: Implement add contact functionality (e.g., show a dialog or navigate to add contact screen)
  }

  void _removeContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trusted Contacts'),
      ),
      body: _contacts.isEmpty
          ? const Center(
              child: Text(
                'No contacts added yet. Tap the + button to add emergency contacts.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            )
          : ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                return Dismissible(
                  key: Key(contact['phone']!),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Theme.of(context).colorScheme.error,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Contact'),
                        content: const Text(
                            'Are you sure you want to delete this contact?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.error,
                            ),
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );
                  },
                  onDismissed: (direction) {
                    setState(() {
                      _contacts.removeAt(index);
                    });
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      contact['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      '${contact['phone']!} • ${contact['relationship']!}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: const Icon(Icons.chevron_right,
                        color: Colors.grey),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addContact,
        label: const Text('Add Contact'),
        icon: const Icon(Icons.person_add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}