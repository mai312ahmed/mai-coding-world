import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TestimonailsModel extends Equatable {
  final String? writer;
  final Timestamp? date;
  final String? content;
  final int? rating;

  const TestimonailsModel({this.writer, this.date, this.content, this.rating});

  factory TestimonailsModel.fromJson(Map<String, dynamic> json) {
    return TestimonailsModel(
      writer: json['writer'] as String?,
      date: json['date'] as Timestamp?,
      content: json['content'] as String?,
      rating: json['rating'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'writer': writer,
    'date': date,
    'content': content,
    'rating': rating,
  };

  @override
  List<Object?> get props => [writer, date, content, rating];
}
