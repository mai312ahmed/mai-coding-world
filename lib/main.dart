import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mai_coding_world/features/home/view/home.dart';
import 'package:mai_coding_world/firebase_options.dart';
import 'cubits/language_cubit.dart';
import 'localization/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseInitializer {
  static final Completer<void> _completer = Completer();

  static Future<void> ensureInitialized() async {
    if (kIsWeb) {
      await _initializeWeb();
    } else {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _completer.complete();
    }
    return _completer.future;
  }

  static Future<void> _initializeWeb() async {
    try {
      // تأخير إضافي للويب
      await Future.delayed(const Duration(milliseconds: 500));

      // تهيئة صريحة مع اسم التطبيق
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
        name: 'WebApp',
      );

      // تأكيد التهيئة
      final app = Firebase.app('WebApp');
      log('Firebase Web App: ${app.name}');
      _completer.complete();
    } catch (e) {
      _completer.completeError(e);
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ⭐ الاستخدام في كل المشروع
  await FirebaseInitializer.ensureInitialized();

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
            title: 'Mai’s Coding World',
            theme: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.grey,
                brightness: Brightness.dark,
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
