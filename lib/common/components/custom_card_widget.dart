import 'package:flutter/material.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;

  final EdgeInsetsGeometry? padding;

  const CustomCardWidget({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppPalette.borderColor, AppPalette.secondaryColor],
        ),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Padding(
        padding: padding ?? const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}
