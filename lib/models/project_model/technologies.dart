import 'package:equatable/equatable.dart';

class Technologies extends Equatable {
  final List<dynamic>? ar;
  final List<dynamic>? en;

  const Technologies({this.ar, this.en});

  factory Technologies.fromJson(Map<String, dynamic> json) => Technologies(
    ar: json['ar'] as List<dynamic>?,
    en: json['en'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {'ar': ar, 'en': en};

  @override
  List<Object?> get props => [ar, en];
}
