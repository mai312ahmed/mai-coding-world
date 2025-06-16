import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final String? ar;
  final String? en;

  const Client({this.ar, this.en});

  factory Client.fromJson(Map<String, dynamic> json) =>
      Client(ar: json['ar'] as String?, en: json['en'] as String?);

  Map<String, dynamic> toJson() => {'ar': ar, 'en': en};

  @override
  List<Object?> get props => [ar, en];
}
