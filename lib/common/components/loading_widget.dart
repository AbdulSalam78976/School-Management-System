import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double size = 160;

    return Stack(
      children: [
        // Fullscreen blurred glass background
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5.0),
            child: Container(color: Colors.transparent),
          ),
        ),

        // Center glassmorphic card with animation
        Center(
          child: Lottie.asset(
            'assets/images/loading.json',
            width: size,
            height: size,
          ),
        ),
      ],
    );
  }
}
