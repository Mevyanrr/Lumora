import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';

class Navbar extends StatefulWidget {
  final int selectedItem;
  const Navbar({super.key, required this.selectedItem});

  @override
  State<Navbar> createState() => _BottomNavState();
}

class _BottomNavState extends State<Navbar> {
  void changeSelectedNavBar(int index) {
    if (index == widget.selectedItem) return;

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/stimulasi');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/milestone');
    }
  }

  BottomNavigationBarItem _navItem({
    required String iconPath,
    required String label,
    required bool isActive,
    required double iconSz,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        width: iconSz,
        height: iconSz,
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
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;

    const fullwidth = 412.0;
    const fullheight = 917.0;

    final radius = sizewidth * 50 / fullwidth;
    final navHeight = sizeheight * 90 / fullheight;
    final iconSz = sizewidth * 26 / fullwidth;

    return ClipPath(
        clipper: BottomNavClipper(
          radius: radius,
          height: navHeight,
        ),
        child: Container(
          color: AppColors.white,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: widget.selectedItem,
            selectedItemColor: AppColors.secondary,
            unselectedItemColor: AppColors.txtPrimary,
            onTap: changeSelectedNavBar,
            items: [
              _navItem(
                  iconPath: 'assets/icons/home.svg',
                  label: 'Beranda',
                  isActive: widget.selectedItem == 0,
                  iconSz: iconSz),
              _navItem(
                  iconPath: 'assets/icons/stimulasi.svg',
                  label: 'Stimulasi',
                  isActive: widget.selectedItem == 1,
                  iconSz: iconSz),
              _navItem(
                  iconPath: 'assets/icons/milestone.svg',
                  label: 'Milestone',
                  isActive: widget.selectedItem == 2,
                  iconSz: iconSz),
            ],
          ),
        ));
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  final double radius;
  final double height;

  BottomNavClipper({
    required this.radius,
    required this.height,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    path.lineTo(size.width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
