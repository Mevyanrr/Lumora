import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:lumora/features/profile/presentation/bloc/profile_event.dart';
import 'package:lumora/features/profile/presentation/bloc/profile_state.dart';
import 'package:lumora/features/profile/presentation/data/profilmenulist.dart';
import 'package:lumora/features/profile/presentation/pages/informasibayi.dart';
import 'package:lumora/features/profile/presentation/pages/pengaturan.dart';
import 'package:lumora/features/profile/presentation/widgets/exit.dart';
import 'package:lumora/features/profile/presentation/widgets/frameprofile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true, 
        leading: IconButton(
          icon: Icon( Icons.arrow_back_ios_rounded),
          color: AppColors.txtPrimary,
           onPressed: () {
              Navigator.pop(context);
            },
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: sizewidth * 22 / fullwidth,
            fontWeight: FontWeight.w600,
            color: AppColors.txtPrimary,
          ),
        ),
        backgroundColor: AppColors.background,
      ),
      body:   BlocListener<ProfileBloc, ProfileState>(
         listener: (context, state) {
           if (state is NavigateToProfile) {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (_) => Informasibayi()),
             );
           }

           if (state is NavigateToSetting) {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (_) => Pengaturan()),
             );
           }

            if (state is Leave) {
             showExitAlert(context);
           }
        },
      child: 
       Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizewidth * 18 / fullwidth,
          vertical: sizeheight * 34 / fullheight,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: sizewidth * 115 / fullwidth,
                  height: sizeheight * 115 / fullheight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/profildummy.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: sizewidth * 36 / fullwidth,
                    height: sizeheight * 36 / fullheight,
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit,
                      size: sizewidth * 18 / fullwidth,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: sizeheight * 16 / fullheight),

            Text(
              "Bunda Aira",
              style: TextStyle(
                fontSize: sizewidth * 20 / fullwidth,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: sizeheight * 6 / fullheight),

            Text(
              "bundaAira@gmail.com",
              style: TextStyle(
                fontSize: sizewidth * 16 / fullwidth,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: sizeheight * 20 / fullheight),

            Container(
              width: double.infinity,
              height: sizeheight * 2 / fullheight,
              decoration: BoxDecoration(color: AppColors.txtSecondary),
            ),

            SizedBox(height: sizeheight * 28 / fullheight),

            Expanded(
              child: ListView.builder(
                itemCount: profileMenuList.length,
                itemBuilder: (context, index) {
                  final item = profileMenuList[index];

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: sizeheight*8/fullheight,
                    ), 
                    child: Frameprofile(
                      size: size,
                      icon: item.icon,
                      title: item.title,
                      onTap: () {
                        context.read<ProfileBloc>().add(
                          ProfileMenuTapped(index),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}
