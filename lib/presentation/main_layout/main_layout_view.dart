import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/explore_view.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/profile_view.dart';
import 'package:online_exam/presentation/main_layout/tabs/result/result_view.dart';
import 'package:online_exam/presentation/main_layout/widgets/bottm_nav_bar_icon_widget.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int _selectedIndex = 0;
  List<Widget> views = [
    const ExploreView(),
    const ResultView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: BottomNavBarIcon(
              isActive: _selectedIndex == 0,
              imagePath: AppStrings.homeIcon,
            ),
            label: AppStrings.explore,
          ),
          BottomNavigationBarItem(
            icon: BottomNavBarIcon(
              isActive: _selectedIndex == 1,
              imagePath: AppStrings.resultIcon,
            ),
            label: AppStrings.result,
          ),
          BottomNavigationBarItem(
            icon: BottomNavBarIcon(
              isActive: _selectedIndex == 2,
              imagePath: AppStrings.personIcon,
            ),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}
