import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/utils/sizes.dart';

import '../resources/color.dart';

class LikeShareContainer extends StatelessWidget {
  final String icon;
  final String title;
  final bool offer;

  const LikeShareContainer(
      {super.key, required this.icon, required this.title, this.offer = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppColors.primaryGradientOne,
                AppColors.primaryGradientSecond
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(offer)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 3,
                        width: 3,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                           color: AppColors.dotGradientSecond,
                        ),
                      ),
                      2.w,
                      Container(
                        height: 3,
                        width: 3,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.dotGradientSecond,
                        ),
                      ),
                    ],
                  ),
                if(offer)
                2.h,
                SvgPicture.asset(
                  icon,
                  height: 25,
                  width: 25,
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
          ),
        ),
        4.h,
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
