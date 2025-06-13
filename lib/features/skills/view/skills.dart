import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/localization/app_localizations.dart';
import 'package:mai_coding_world/models/skill_info.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = ScreenHelper.isSmall(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? smallHorizontalPadding : horizontalPadding,
        vertical: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: "skills"),
          const SizedBox(height: 50),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills.map((skill) => SkillCard(skill: skill)).toList(),
          ),
        ],
      ),
    );
  }
}

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
