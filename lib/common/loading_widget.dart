import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    final indicatorSize = size + 40;
    return SizedBox(
      width: indicatorSize,
      height: indicatorSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppPalette.primaryColor,
              ),
            ),
          ),
          Container(
            width: size + 32,
            height: size + 32,
            decoration: BoxDecoration(
              color: AppPalette.accentColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/images/loading.json',
              width: size,
              height: size,
              // delegates: LottieDelegates(...), // for color customization
            ),
          ),
        ],
      ),
    );
  }
}
