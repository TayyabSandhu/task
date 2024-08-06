import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/resources/color.dart';
import 'package:task/utils/sizes.dart';
import 'package:task/views/home/home_view.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeView(),
    const Center(child: Text("Search")),
    const Center(child: Text("Add Post")),
    const Center(child: Text("Deals")),
    const Center(child: Text("Profile")),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          backgroundColor: AppColors.bottomNavBarColor,
          selectedItemColor: AppColors.unSelectedColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/icons/home.svg"),
                  4.h,
                  const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.unSelectedColor,
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const RadialGradient(
                        center: Alignment.centerLeft,
                        radius: 1.0,
                        colors: <Color>[
                          AppColors.primaryGradientOne,
                          AppColors.primaryGradientSecond,
                        ],
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/home.svg",
                      colorFilter: const ColorFilter.mode(
                        AppColors.unSelectedColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  4.h,
                  const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryGradientSecond,
                    ),
                  ),
                ],
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icons/Search.svg",
                    colorFilter: const ColorFilter.mode(
                      AppColors.unSelectedColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  4.h,
                  const Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.unSelectedColor,
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const RadialGradient(
                        center: Alignment.centerLeft,
                        radius: 1.0,
                        colors: <Color>[
                          AppColors.primaryGradientOne,
                          AppColors.primaryGradientSecond,
                        ],
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/Search.svg",
                      colorFilter: const ColorFilter.mode(
                        AppColors.unSelectedColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  4.h,
                  const Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryGradientSecond,
                    ),
                  ),
                ],
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
                icon: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryGradientOne,
                        AppColors.primaryGradientSecond
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/icons/deals.svg"),
                  4.h,
                  const Text(
                    "Deals",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.unSelectedColor,
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const RadialGradient(
                        center: Alignment.centerLeft,
                        radius: 1.0,
                        colors: <Color>[
                          AppColors.primaryGradientOne,
                          AppColors.primaryGradientSecond,
                        ],
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/deals.svg",
                      colorFilter: const ColorFilter.mode(
                        AppColors.unSelectedColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  4.h,
                  const Text(
                    "Deals",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryGradientSecond,
                    ),
                  ),
                ],
              ),
              label: 'Deals',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/icons/profile.svg"),
                  4.h,
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.unSelectedColor,
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const RadialGradient(
                        center: Alignment.centerLeft,
                        radius: 1.0,
                        colors: <Color>[
                          AppColors.primaryGradientOne,
                          AppColors.primaryGradientSecond,
                        ],
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/profile.svg",
                      colorFilter: const ColorFilter.mode(
                        AppColors.unSelectedColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  4.h,
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryGradientSecond,
                    ),
                  ),
                ],
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
