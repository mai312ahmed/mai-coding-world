import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/utils/helper_method.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/localization/app_localizations.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
          Row(children: [BigText(text: "contactMe")]),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children:
                contacts.map((contact) {
                  return ActionChip(
                    avatar: FaIcon(
                      contact.icon,
                      size: 18,
                      color: contact.color,
                    ),
                    label: Text(
                      AppLocalizations.of(context)?.translate(contact.label) ??
                          contact.label,
                    ),
                    backgroundColor: Colors.white12,
                    labelStyle: const TextStyle(color: Colors.white),
                    onPressed: () => launchURL(contact.url),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
