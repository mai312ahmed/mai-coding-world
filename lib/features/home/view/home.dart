import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/cubits/navigation_cubit.dart';
import 'package:mai_coding_world/features/home/widget/home_page_view_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => NavigationCubit({
            'about': GlobalKey(),
            'projects': GlobalKey(),
            'skills': GlobalKey(),
            'testimonials': GlobalKey(),
            'contactMe': GlobalKey(),
          }),
      child: const Scaffold(body: HomePageView()),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomePageViewBody());
  }
}
