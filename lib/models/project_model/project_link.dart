import 'package:equatable/equatable.dart';

import 'name.dart';

class ProjectLink extends Equatable {
  final Name? name;
  final String? url;

  const ProjectLink({this.name, this.url});

  factory ProjectLink.fromJson(Map<String, dynamic> json) => ProjectLink(
    name:
        json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
    url: json['url'] as String?,
  );

  Map<String, dynamic> toJson() => {'name': name?.toJson(), 'url': url};

  @override
  List<Object?> get props => [name, url];
}
