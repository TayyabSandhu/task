import 'package:flutter/material.dart';

import '../resources/color.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final bool loading;

  final VoidCallback onPress;

  const GradientButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress, this.titleColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: 50,
        width: loading ? 60 : MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryGradientOne, AppColors.primaryGradientSecond],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Center(
                child: Text(
                  title,
                  style:  TextStyle(
                    color: titleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ),
    );
  }
}
