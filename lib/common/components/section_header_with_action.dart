import 'package:flutter/material.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class SectionHeaderWithAction extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SectionHeaderWithAction({
    super.key,
    required this.title,
     this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppPalette.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        (onTap == null) ? const SizedBox() : TextButton(onPressed: onTap, child: const Text('See All')),
      ],
    );
  }
}
