import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/allWidgets/round_button.dart';
import 'package:task/model/post_model.dart';
import 'package:task/resources/color.dart';
import 'package:task/utils/sizes.dart';

import '../../allWidgets/like_share_container.dart';
import '../../allWidgets/video_viewer.dart';
import '../../data/response/status.dart';
import '../../resources/components/general_exception.dart';
import '../../resources/components/internet_exceptions_widget.dart';
import '../../view_model/get_api/post_view_model.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final postVM = Get.put(PostViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          switch (postVM.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryGradientOne,
                ),
              );
            case Status.ERROR:
              if (postVM.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    postVM.refreshApi();
                  },
                );
              } else {
                return GeneralExceptionWidget(
                  onPress: () {
                    postVM.refreshApi();
                  },
                );
              }
            case Status.COMPLETED:
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: postVM.postList.value.posts?.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = postVM.postList.value.posts?[index];
                  return Stack(
                    children: [
                      data?.postVideo != null
                          ? VideoViewer(
                              link: data!.postVideo,
                            )
                          : const Text("No Video"),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          width: context.screenWidth,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                postDetails(data),
                                24.w,
                                likeShareWidget(data),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
          }
        },
      ),
    );
  }

  Widget likeShareWidget(Posts? data) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const LikeShareContainer(
          icon: 'assets/icons/offer.svg',
          title: "Offer",
          offer: true,
        ),
        16.h,
        LikeShareContainer(
          icon: 'assets/icons/like.svg',
          title: data?.likes.toString() ?? "",
        ),
        16.h,
        LikeShareContainer(
          icon: 'assets/icons/comment.svg',
          title: data?.comments.toString() ?? "",
        ),
        16.h,
        LikeShareContainer(
          icon: 'assets/icons/share.svg',
          title: data?.shares.toString() ?? "",
        ),
        16.h,
        data?.profileImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  data!.profileImage,
                  height: 48,
                  width: 48,
                ),
              )
            : Container(),
        56.h,
      ],
    );
  }

  Widget postDetails(Posts? data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data?.postTitle ?? "",
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        4.h,
        Text(
          "AED ${data?.price.toString()}" ?? "",
          style: const TextStyle(
            color: AppColors.currencyColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        4.h,
        Text(
          data?.hashtagTitles ?? "",
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        8.h,
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                "assets/images/uae flag.png",
                height: 24,
                width: 24,
              ),
            ),
            8.w,
            Text(
              data?.country ?? "",
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        11.h,
        SizedBox(
          height: 40,
          width: 150.0,
          child: GradientButton(
            title: "Visit Website",
            onPress: () {},
          ),
        ),
        24.h,
      ],
    );
  }
}
