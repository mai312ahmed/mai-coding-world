import 'package:equatable/equatable.dart';

class Name extends Equatable {
  final String? ar;
  final String? en;

  const Name({this.ar, this.en});

  factory Name.fromJson(Map<String, dynamic> json) =>
      Name(ar: json['ar'] as String?, en: json['en'] as String?);

  Map<String, dynamic> toJson() => {'ar': ar, 'en': en};

  @override
  List<Object?> get props => [ar, en];
}
