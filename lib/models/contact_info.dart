import 'package:flutter/material.dart';

class ContactInfo {
  final String label;
  final String url;
  final IconData icon;
  final Color color;

  const ContactInfo({
    required this.label,
    required this.url,
    required this.icon,
    required this.color,
  });
}
