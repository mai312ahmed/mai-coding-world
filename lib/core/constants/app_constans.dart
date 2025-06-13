import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mai_coding_world/models/contact_info.dart';
import 'package:mai_coding_world/models/link_model.dart';
import 'package:mai_coding_world/models/skill_info.dart';

const double horizontalPadding = 100;
const double smallHorizontalPadding = 50;
final List<ContactInfo> contacts = [
  ContactInfo(
    label: "linkedin",
    url: 'https://www.linkedin.com/in/your-profile',
    icon: FontAwesomeIcons.linkedin,
    color: Color(0xFF0A66C2),
  ),
  ContactInfo(
    label: "github",
    url: 'https://github.com/your-username',
    icon: FontAwesomeIcons.github,
    color: Colors.white,
  ),
  ContactInfo(
    label: "email",
    url: 'mailto:mai96oda@email.com',
    icon: FontAwesomeIcons.solidEnvelope,
    color: Colors.white,
  ),
  ContactInfo(
    label: "whatsapp",
    url: 'https://wa.me/971566982496',
    icon: FontAwesomeIcons.whatsapp,
    color: Color(0xFF25D366),
  ),
];

final List<Skill> skills = [
  Skill(
    name: "flutter",
    icon: FontAwesomeIcons.flutter,
    color: Color(0xFF02569B),
  ),
  Skill(
    name: "dart",
    icon: FontAwesomeIcons.dartLang,
    color: Color(0xFF0175C2),
  ),
  Skill(
    name: "firebase",
    icon: FontAwesomeIcons.fire,
    color: Color(0xFFFFCA28),
  ),
  Skill(
    name: "githubSkill",
    icon: FontAwesomeIcons.github,
    color: Colors.white,
  ),
  Skill(name: "restAPI", icon: FontAwesomeIcons.link, color: Colors.blueGrey),
  Skill(
    name: "stateManagement",
    icon: FontAwesomeIcons.gears,
    color: Colors.white,
  ),
  Skill(
    name: "uiuxDesign",
    icon: FontAwesomeIcons.palette,
    color: Colors.orangeAccent,
  ),
  Skill(
    name: "localization",
    icon: FontAwesomeIcons.language,
    color: Colors.white,
  ),
  Skill(
    name: "cleanArchitecture",
    icon: FontAwesomeIcons.layerGroup,
    color: Colors.indigo,
  ),
  Skill(
    name: "responsiveDesign",
    icon: FontAwesomeIcons.tabletScreenButton,
    color: Colors.green,
  ),
  Skill(
    name: "animation",
    icon: FontAwesomeIcons.waveSquare,
    color: Colors.white,
  ),
  Skill(name: "localDB", icon: FontAwesomeIcons.database, color: Colors.brown),
  Skill(
    name: "pushNotifications",
    icon: FontAwesomeIcons.bell,
    color: Colors.white,
  ),
  Skill(
    name: "performanceOptimization",
    icon: FontAwesomeIcons.gaugeHigh,
    color: Colors.white,
  ),
  Skill(
    name: "figmaToFlutter",
    icon: FontAwesomeIcons.figma,
    color: Colors.purple,
  ),
];
final List<LinkModel> links = [
  LinkModel(id: 'about', label: 'aboutMe'),
  LinkModel(id: 'projects', label: 'projects'),
  LinkModel(id: 'skills', label: 'skills'),
  LinkModel(id: 'testimonials', label: 'testimonials'),
  LinkModel(id: 'contactMe', label: 'contactMe'),
];
