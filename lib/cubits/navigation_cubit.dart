import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationState {
  final String? scrollToId;
  NavigationState({this.scrollToId});
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit(this.sectionKeys) : super(NavigationState(scrollToId: null));

  final Map<String, GlobalKey> sectionKeys;

  void scrollToSection(String id) {
    emit(NavigationState(scrollToId: id));
  }
}
