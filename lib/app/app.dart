import 'package:flutter/material.dart';
import 'package:sweater/app/app_router.dart';
import 'package:sweater/core/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig:AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme:AppTheme.light,
      darkTheme:AppTheme.dark,

      themeMode: ThemeMode.system,
    
      
    )  ;}
}