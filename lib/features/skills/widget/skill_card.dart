import 'package:flutter/material.dart';
import 'package:mai_coding_world/localization/app_localizations.dart';
import 'package:mai_coding_world/models/skill_info.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(skill.icon, color: skill.color),
          const SizedBox(width: 10),
          Text(
            AppLocalizations.of(context)?.translate(skill.name) ?? skill.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
