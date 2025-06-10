import 'package:flutter/material.dart';

class ProjectUrlSection extends StatelessWidget {
  const ProjectUrlSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.open_in_new),
        label: const Text('Open Project', style: TextStyle(fontSize: 16)),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.blue.shade700,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
