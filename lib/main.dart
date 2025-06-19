import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mai_coding_world/features/home/view/home.dart';
import 'package:mai_coding_world/firebase_options.dart';
import 'cubits/cubits/language_cubit.dart';
import 'localization/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseInitializer {
  static Completer<void>? _completer;

  static Future<void> ensureInitialized() async {
    if (_completer != null) {
      return _completer!.future;
    }

    _completer = Completer();

    try {
      if (kIsWeb) {
        await Future.delayed(const Duration(milliseconds: 500));
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
          name: 'WebApp',
        );
        final app = Firebase.app('WebApp');
        log('Firebase Web App: ${app.name}');
      } else {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }

      _completer!.complete();
    } catch (e) {
      _completer!.completeError(e);
    }

    return _completer!.future;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Portfolio – Mai Abdalla',
            theme: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.grey,
                brightness: Brightness.dark,
              ),
              textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: state.locale == 'ar' ? 'Tajawal' : null,
              ),
            ),
            locale: Locale(state.locale),
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
