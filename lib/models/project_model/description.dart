import 'package:equatable/equatable.dart';

class Description extends Equatable {
  final String? ar;
  final String? en;

  const Description({this.ar, this.en});

  factory Description.fromJson(Map<String, dynamic> json) =>
      Description(ar: json['ar'] as String?, en: json['en'] as String?);

  Map<String, dynamic> toJson() => {'ar': ar, 'en': en};

  @override
  List<Object?> get props => [ar, en];
}
