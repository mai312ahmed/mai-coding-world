class ProjectModel {
  final String title;
  final String description;
  final List<String> imageUrl;
  final List<String> technologies;
  final List<String> features;
  final String projectUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.features = const [],
    this.projectUrl = '',
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: List<String>.from(map['imageUrl'] ?? []),
      technologies: List<String>.from(map['technologies'] ?? []),
      features: List<String>.from(map['features'] ?? []),
      projectUrl: map['projectUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'technologies': technologies,
      'features': features,
      'projectUrl': projectUrl,
    };
  }
}
