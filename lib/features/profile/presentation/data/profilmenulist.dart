import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lumora/features/profile/domain/models/profile_menu_item.dart';

const List<ProfileMenuItem> profileMenuList = [
  ProfileMenuItem(
    icon: Icons.person,
    title: 'Informasi Bayi',
  ),
  ProfileMenuItem(
    icon: Icons.settings,
    title: 'Pengaturan',
  ),
  ProfileMenuItem(
    icon: Icons.notifications,
    title: 'Kontak',
  ),
  ProfileMenuItem(
    icon: FontAwesomeIcons.crown,
    title: 'Premium',
  ),
  ProfileMenuItem(
    icon: Icons.support_rounded,
    title: 'Premium',
  ),
  ProfileMenuItem(
    icon: Icons.logout_outlined,
    title: 'Keluar',
  ),
];
