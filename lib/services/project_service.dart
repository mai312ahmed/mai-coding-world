import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mai_coding_world/models/project_model/project_model.dart';

class ProjectService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProjectModel>?> getProjects() async {
    try {
      final snapshot = await _firestore.collection('projects').get();
      return snapshot.docs.map((doc) {
        return ProjectModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      log('Error getting projects: $e');
      return [];
    }
  }
}
