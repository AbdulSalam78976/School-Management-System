import 'package:flutter/material.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;

  final EdgeInsetsGeometry? padding;

  const CustomCardWidget({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width / 2.5,
      height: height / 7,
      child: Material(
        shadowColor: AppPalette.primaryColor,
        elevation: 2,
        color: AppPalette.secondaryColor,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}
