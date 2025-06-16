import 'package:equatable/equatable.dart';

class Features extends Equatable {
  final List<String>? ar;
  final List<String>? en;

  const Features({this.ar, this.en});

  factory Features.fromJson(Map<String, dynamic> json) => Features(
    ar: json['ar'] != null ? List<String>.from(json['ar']) : null,
    en: json['en'] != null ? List<String>.from(json['en']) : null,
  );

  Map<String, dynamic> toJson() => {'ar': ar, 'en': en};

  @override
  List<Object?> get props => [ar, en];
}
