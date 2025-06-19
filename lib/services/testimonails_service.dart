import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mai_coding_world/models/project_model/testimonails_model.dart';

class TestimonailsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<TestimonailsModel>?> getTestimonails() async {
    try {
      final snapshot =
          await _firestore
              .collection('testimonails')
              .orderBy('date', descending: true)
              .get();
      return snapshot.docs.map((doc) {
        return TestimonailsModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      log('Error getting projects: $e');
      return [];
    }
  }

  Future<bool> addTestimonails(TestimonailsModel testimonail) async {
    try {
      await _firestore.collection('testimonails').add(testimonail.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
