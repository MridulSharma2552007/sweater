import 'package:flutter/material.dart';
import 'package:sweater/core/theme/app_text_theme.dart';
import 'package:sweater/core/theme/theme.dart';

class Onboardroot extends StatefulWidget {
  const Onboardroot({super.key});

  @override
  State<Onboardroot> createState() => _OnboardrootState();
}

class _OnboardrootState extends State<Onboardroot> {
  static const int pageCount = 4;
  int currentIndex = 0;

  void incrementer() {
    setState(() {
      currentIndex = (currentIndex + 1) % pageCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Skip intro', style: AppTextTheme.textTheme.labelSmall),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    pageCount,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        width: currentIndex == index 
                        ? 30 :20,
                        height: 5,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? AppTheme.accentRust(context)
                              : AppTheme.line(context),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  height: 80,
                  width: 80,

                  decoration: BoxDecoration(
                    color: AppTheme.accentRust(context),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text('S')),
                ),
                SizedBox(height: 20),
                Text("Meet Sweater"),
                SizedBox(height: 20),
                Text(
                  'A warm little home for everything you think, read, and \n remember — kept in plain Markdown, on your machine.',
                ),
                SizedBox(height: 40),

                ElevatedButton(
                  onPressed: incrementer,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppTheme.accentRust(context),
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      AppTheme.ink(context),
                    ),

                    fixedSize: MaterialStatePropertyAll(
                      Size(double.infinity, 60),
                    ),
                  ),
                  child: Text('Get Started'),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
