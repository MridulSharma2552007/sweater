import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sweater/app/features/onboarding/presentation/pages/onboardroot.dart';

class AppRouter {
  static final router=GoRouter(
    routes:[
      GoRoute(path: '/', builder: (context,state)=>Onboardroot())
    ]
  );
}