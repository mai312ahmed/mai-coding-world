import 'package:equatable/equatable.dart';

class Languages extends Equatable {
  final String? ar;
  final String? en;

  const Languages({this.ar, this.en});

  factory Languages.fromJson(Map<String, dynamic> json) =>
      Languages(ar: json['ar'] as String?, en: json['en'] as String?);

  Map<String, dynamic> toJson() => {'ar': ar, 'en': en};

  @override
  List<Object?> get props => [ar, en];
}
