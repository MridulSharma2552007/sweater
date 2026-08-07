import 'package:flutter/material.dart';
import 'package:sweater/core/theme/app_text_theme.dart';
import 'package:sweater/core/theme/theme.dart';

class SweaterAccentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const SweaterAccentButton({
    required this.onPressed,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppTheme.accentRust(context)),
        foregroundColor: WidgetStateProperty.all(
          AppTheme.terminalPaper(context),
        ),
        fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 60)),
      ),
      child: Text(label, style: AppTextTheme.textTheme.bodyMedium),
    );
  }
}

class SweaterInactiveButton extends StatelessWidget {
   final VoidCallback onPressed;
  final String label;
  const SweaterInactiveButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20)
        )),
    
        
        backgroundColor: WidgetStateProperty.all(AppTheme.terminalPaper(context)),
        foregroundColor: WidgetStateProperty.all(
          AppTheme.ink(context),
        ),
          side: MaterialStateProperty.resolveWith<BorderSide?>(
    (states) {
      final opacity = states.contains(MaterialState.hovered) ? 0.6: 0.1;
      return BorderSide(
        color: AppTheme.ink(context).withOpacity(opacity),
        width: 1,
      );
    },
  ),
        fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 60)),
      ),
      
      
      child: Text(label, style: AppTextTheme.textTheme.bodyMedium),
    );
  }
}
