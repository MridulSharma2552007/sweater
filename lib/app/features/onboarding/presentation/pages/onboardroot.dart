import 'package:flutter/material.dart';
import 'package:sweater/core/share/widgets/widgets.dart';
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

  void decrementer() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex -= 1;
      }
    });
  }

  Widget _buildPageContent(BuildContext context) {
    return Column(
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
                width: currentIndex == index ? 40 : 20,
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
        SizedBox(height: 40),
        OnboardingPageContent(
          currentIndex: currentIndex,
          onPressed: incrementer,
          onBackPressed: decrementer,
        ),
      ],
    );
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
          Center(child: _buildPageContent(context)),
          const Spacer(),
        ],
      ),
    );
  }
}

class OnboardingPageContent extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onPressed;
  final VoidCallback onBackPressed;

  const OnboardingPageContent({
    required this.currentIndex,
    required this.onPressed,
    required this.onBackPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return _buildPageZero(context);
      case 1:
        return _buildPageOne(context);
      case 2:
        return _buildPageTwo(context);
      case 3:
      default:
        return _buildPageThree(context);
    }
  }

  Widget _buildPageZero(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: AppTheme.accentRust(context),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(child: Text('S')),
        ),
        const SizedBox(height: 20),
        Text(
          'Meet Sweater',
          style: AppTextTheme.textTheme.bodyLarge,
          selectionColor: AppTheme.ink(context),
        ),
        const SizedBox(height: 20),
        Text(
          'A warm little home for everything you think, read, and \n remember — kept in plain Markdown, on your machine.',
          style: AppTextTheme.textTheme.bodySmall,
          selectionColor: AppTheme.inkSoft(context),
        ),

       
        const SizedBox(height: 40),
        SweaterAccentButton(onPressed: onPressed, label: 'Get Started'),
      ],
    );
  }

  Widget _buildPageOne(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      

      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppTheme.accentSageDim(context),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Icon(
              Icons.indeterminate_check_box,
              color: AppTheme.accentSage(context),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Where should we knit your \n notes?',
          style: AppTextTheme.textTheme.bodyLarge,
          selectionColor: AppTheme.ink(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          'Pick a folder on this device. Sweater reads and writes plain\n .md files there — nothing leaves your computer unless you tell\nit to.',
          textAlign: TextAlign.center,
          style: AppTextTheme.textTheme.bodySmall,
          selectionColor: AppTheme.inkSoft(context),
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              
              'VAULT LOCATION',
              style: AppTextTheme.textTheme.labelSmall,
            
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10,),
                   Container(
          height: 80,
          width: 600,
          decoration: BoxDecoration(
            color: AppTheme.accentRustDim(context).withAlpha(10),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(Icons.folder, color: AppTheme.accentRust(context)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  '~/Documents/sweater',
                  style: AppTextTheme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    AppTheme.accentRust(context),
                  ),
                  foregroundColor: WidgetStateProperty.all(
                    AppTheme.terminalPaper(context),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text('Browse'),
              ),
            ],
          ),
        ),

    
          ],
        ),

     const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SweaterInactiveButton(onPressed: onBackPressed, label: 'Back'),
            const SizedBox(width: 20),
            SweaterAccentButton(onPressed: onPressed, label: 'Continue'),
          ],
        ),
      ],
    );
  }

  Widget _buildPageTwo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: AppTheme.line(context),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(child: Text('M')),
        ),
        const SizedBox(height: 20),
        Text(
          'Markdown Ready',
          style: AppTextTheme.textTheme.bodyLarge,
          selectionColor: AppTheme.ink(context),
        ),
        const SizedBox(height: 20),
        Text(
          'A clean writing experience that stays portable and easy to edit.',
          style: AppTextTheme.textTheme.bodySmall,
          selectionColor: AppTheme.inkSoft(context),
        ),
        const SizedBox(height: 40),
        SweaterAccentButton(onPressed: onPressed, label: 'Next'),
      ],
    );
  }

  Widget _buildPageThree(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: AppTheme.ink(context),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(child: Text('A')),
        ),
        const SizedBox(height: 20),
        Text(
          'All Your Thoughts',
          style: AppTextTheme.textTheme.bodyLarge,
          selectionColor: AppTheme.ink(context),
        ),
        const SizedBox(height: 20),
        Text(
          'A private place for everything you want to remember and revisit.',
          style: AppTextTheme.textTheme.bodySmall,
          selectionColor: AppTheme.inkSoft(context),
        ),
        const SizedBox(height: 40),
        SweaterAccentButton(onPressed: onPressed, label: 'Restart'),
      ],
    );
  }
}
