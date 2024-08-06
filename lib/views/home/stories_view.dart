import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/resources/color.dart';
import 'package:task/utils/sizes.dart';

import '../../resources/components/stories_circle.dart';
import '../../view_model/controllers/stories_view_model.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  final storiesVM = Get.put(StoriesViewModel());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: ListView.builder(
          itemCount: storiesVM.storiesList.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var data = storiesVM.storiesList[index];
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CustomPaint(
                      painter: StoriesCircle(),
                      child: Center(
                        child: data.image.endsWith('.svg')
                            ? Stack(
                              children: [
                                SvgPicture.asset(
                                    data.image,
                                    height: 24,
                                    width: 24,
                                  ),
                                if(index == 2)
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [AppColors.dotGradientOne, AppColors.dotGradientSecond],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          )
                                      ),
                                    ),
                                  ),
                              ],
                            )
                            : CircleAvatar(
                                child: Image.asset(
                                  data.image,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                      ),
                    ),
                  ),
                  8.h,
                  Text(
                    data.title,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
