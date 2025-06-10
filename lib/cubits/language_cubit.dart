import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState('en'));

  void toggleLanguage() {
    emit(
      state.locale == 'en'
          ? const LanguageState('ar')
          : const LanguageState('en'),
    );
  }
}

class LanguageState extends Equatable {
  final String locale;

  const LanguageState(this.locale);

  @override
  List<Object> get props => [locale];
}
