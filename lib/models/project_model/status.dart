import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final String? ar;
  final String? en;

  const Status({this.ar, this.en});

  factory Status.fromJson(Map<String, dynamic> json) =>
      Status(ar: json['ar'] as String?, en: json['en'] as String?);

  Map<String, dynamic> toJson() => {'ar': ar, 'en': en};

  @override
  List<Object?> get props => [ar, en];
}
