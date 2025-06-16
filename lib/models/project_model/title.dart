import 'package:equatable/equatable.dart';

class Title extends Equatable {
  final String? ar;
  final String? en;

  const Title({this.ar, this.en});

  factory Title.fromJson(Map<String, dynamic> json) =>
      Title(ar: json['ar'] as String?, en: json['en'] as String?);

  Map<String, dynamic> toJson() => {'ar': ar, 'en': en};

  @override
  List<Object?> get props => [ar, en];
}
