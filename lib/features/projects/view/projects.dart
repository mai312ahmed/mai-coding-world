import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/features/projects/widget/project_card.dart';
import 'package:mai_coding_world/models/project_model.dart';
import 'package:mai_coding_world/services/project_service.dart';

final List<ProjectModel> projects = [
  ProjectModel(
    title: 'Portfolio Website',
    description:
        'A modern, responsive personal portfolio website built using Flutter Web. It showcases projects, skills, and includes contact functionality.',
    imageUrl: [
      'assets/images/about_pic.png',
      'assets/images/iiabout_pic.png',
      'assets/images/app.png',
      'assets/images/about_pic.png',
      'assets/images/iiabout_pic.png',
      'assets/images/app.png',
    ],
    technologies: [
      'Flutter',
      'Dart',
      'Firebase',
      'Responsive Design',
      'Flutter',
      'Dart',
      'Firebase',
      'Responsive Design',
      'Flutter',
      'Dart',
      'Firebase',
      'Responsive Design',
      'Flutter',
      'Dart',
      'Firebase',
      'Responsive Design',
    ],
    features: [
      'Dark & Light Mode',
      'Multilingual Support',
      'Contact Form with Firebase',
      'Animated Page Transitions',
      'Dark & Light Mode',
      'Multilingual Support',
      'Contact Form with Firebase',
      'Animated Page Transitions',
      'Dark & Light Mode',
      'Multilingual Support',
      'Contact Form with Firebase',
      'Animated Page Transitions',
      'Dark & Light Mode',
      'Multilingual Support',
      'Contact Form with Firebase',
      'Animated Page Transitions',
      'Dark & Light Mode',
      'Multilingual Support',
      'Contact Form with Firebase',
      'Animated Page Transitions',
      'Dark & Light Mode',
      'Multilingual Support',
      'Contact Form with Firebase',
      'Animated Page Transitions',
      'Dark & Light Mode',
      'Multilingual Support',
      'Contact Form with Firebase',
      'Animated Page Transitions',
    ],
    projectUrl: 'https://github.com/yourusername/portfolio',
  ),
  ProjectModel(
    title: 'Food Delivery App',
    description:
        'A complete mobile app for food delivery with real-time tracking and user authentication.',
    imageUrl: [
      'assets/images/app.png',
      'assets/images/iiabout_pic.png',
      'assets/images/about_pic.png',
    ],
    technologies: ['Flutter', 'Firebase', 'Google Maps API'],
    features: [
      'Live Order Tracking',
      'Push Notifications',
      'Restaurant Listings',
      'In-App Chat Support',
    ],
    projectUrl: 'https://github.com/yourusername/food-delivery',
  ),
  ProjectModel(
    title: 'E-Commerce Dashboard',
    description:
        'An admin dashboard to manage products, users, and orders for an e-commerce platform.',
    imageUrl: [
      'assets/images/iiabout_pic.png',
      'assets/images/about_pic.png',
      'assets/images/app.png',
    ],
    technologies: ['Flutter', 'Dio', 'Charts', 'Responsive Layout'],
    features: [
      'Product & Inventory Management',
      'Sales Analytics',
      'User Roles & Permissions',
      'Responsive Web Design',
    ],
    projectUrl: 'https://github.com/yourusername/ecommerce-dashboard',
  ),
  ProjectModel(
    title: 'Chat App',
    description:
        'A real-time chat application using Firebase Firestore and Firebase Auth with beautiful UI and animations.',
    imageUrl: [
      'assets/images/iiabout_pic.png',
      'assets/images/about_pic.png',
      'assets/images/app.png',
    ],
    technologies: ['Flutter', 'Firebase Auth', 'Firestore', 'Provider'],
    features: [
      'Real-time Messaging',
      'User Authentication',
      'Group Chats',
      'Typing Indicator & Online Status',
    ],
    projectUrl: 'https://github.com/yourusername/chat-app',
  ),
];

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = ScreenHelper.isSmall(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: isSmall ? smallHorizontalPadding : horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: 'projects'),
          const SizedBox(height: 50),
          FutureBuilder(
            future: ProjectService().getProjects(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                height: isSmall ? 350 : 400,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ProjectCard(project: projects[index]);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
