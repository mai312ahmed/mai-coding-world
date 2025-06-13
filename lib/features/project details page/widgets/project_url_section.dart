import 'package:flutter/material.dart';
import 'package:mai_coding_world/localization/app_localizations.dart';

class ProjectUrlSection extends StatelessWidget {
  const ProjectUrlSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.open_in_new),
        label: Text(
          AppLocalizations.of(context)?.translate("label_open_project") ??
              "label_open_project",
          style: TextStyle(fontSize: 16),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          backgroundColor: Colors.white12,
          foregroundColor: Colors.blue.shade700,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
