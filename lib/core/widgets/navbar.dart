import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';

class Navbar extends StatefulWidget {
  final int selectedItem;
  const Navbar({
    super.key, required this.selectedItem});

  @override
  State<Navbar> createState() => _BottomNavState();
}

class _BottomNavState extends State<Navbar> {
  void changeSelectedNavBar(int index) {
    if (index == widget.selectedItem) return;

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/homepage');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '');
    }
  }

  BottomNavigationBarItem _navItem({
    required String iconPath,
    required String label,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        width: 26,
        height: 26,
        colorFilter: ColorFilter.mode(
          isActive ? AppColors.secondary : AppColors.txtPrimary,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(50),
      topRight: Radius.circular(50),
    ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        elevation: 0,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: AppColors.txtPrimary,
        currentIndex: widget.selectedItem,
        onTap: changeSelectedNavBar,
        items: [
          _navItem(
            iconPath: 'assets/icons/home.svg',
            label: 'Beranda',
            isActive: widget.selectedItem == 0,
          ),
          _navItem(
            iconPath: 'assets/icons/stimulasi.svg',
            label: 'Stimulasi',
            isActive: widget.selectedItem == 1,
          ),
          _navItem(
            iconPath: 'assets/icons/milestone.svg',
            label: 'Milestone',
            isActive: widget.selectedItem == 2,
          ),
        ],
      ),
    );
  }
}
