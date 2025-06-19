import 'package:equatable/equatable.dart';

import 'client.dart';
import 'description.dart';
import 'features.dart';
import 'languages.dart';
import 'project_link.dart';
import 'status.dart';
import 'technologies.dart';
import 'title.dart';

class ProjectModel extends Equatable {
  final Title? title;
  final Description? description;
  final Features? features;
  final Technologies? technologies;
  final Status? status;
  final Client? client;
  final List<ProjectLink>? projectLinks;
  final List<dynamic>? imageUrls;
  final Languages? languages;

  const ProjectModel({
    this.title,
    this.description,
    this.features,
    this.technologies,
    this.status,
    this.client,
    this.projectLinks,
    this.imageUrls,
    this.languages,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    title:
        json['title'] == null
            ? null
            : Title.fromJson(json['title'] as Map<String, dynamic>),
    description:
        json['description'] == null
            ? null
            : Description.fromJson(json['description'] as Map<String, dynamic>),
    features:
        json['features'] == null
            ? null
            : Features.fromJson(json['features'] as Map<String, dynamic>),
    technologies:
        json['technologies'] == null
            ? null
            : Technologies.fromJson(
              json['technologies'] as Map<String, dynamic>,
            ),
    status:
        json['status'] == null
            ? null
            : Status.fromJson(json['status'] as Map<String, dynamic>),
    client:
        json['client'] == null
            ? null
            : Client.fromJson(json['client'] as Map<String, dynamic>),
    projectLinks:
        (json['projectLinks'] as List<dynamic>?)
            ?.map((e) => ProjectLink.fromJson(e as Map<String, dynamic>))
            .toList(),
    imageUrls: json['imageUrls'] as List<dynamic>?,
    languages:
        json['languages'] == null
            ? null
            : Languages.fromJson(json['languages'] as Map<String, dynamic>),
  );

  @override
  List<Object?> get props {
    return [
      title,
      description,
      features,
      technologies,
      status,
      client,
      projectLinks,
      imageUrls,
      languages,
    ];
  }
}
