import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/profile/presentation/bloc/setting_bloc.dart';
import 'package:lumora/features/profile/presentation/bloc/setting_event.dart';
import 'package:lumora/features/profile/presentation/bloc/setting_state.dart';
import 'package:lumora/features/profile/presentation/widgets/framesecondary.dart';

class Pengaturan extends StatelessWidget {
  const Pengaturan({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return BlocProvider(
      create: (_) => SettingBloc()..add(LoadSetting()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.txtPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Pengaturan",
            style: TextStyle(
              fontSize: sizewidth * 22 / fullwidth,
              fontWeight: FontWeight.w600,
              color: AppColors.txtPrimary,
            ),
          ),
          backgroundColor: AppColors.background,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: sizewidth * 17 / fullwidth,
              right: sizewidth * 17 / fullwidth,
              top: sizeheight * 27 / fullheight,
              bottom: sizeheight * 47 / fullheight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                BlocBuilder<SettingBloc, SettingState>(
                  builder: (context, state) {
                    if (state is SettingLoaded) {
                      return Column(
                        children: List.generate(state.items.length, (index) {
                          final item = state.items[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: sizeheight * 8 / fullheight,
                            ),
                            child: Framesecondary(
                              size: size,
                              icon: item.icon,
                              title: item.title,
                            ),
                          );
                        }),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),

                SizedBox(height: sizeheight * 52 / fullheight),

                Text(
                  "Informasi Tambahan",
                  style: TextStyle(
                    fontSize: sizewidth * 18 / fullwidth,
                    fontWeight: FontWeight.w500,
                    color: AppColors.txtPrimary,
                  ),
                ),

                SizedBox(height: sizeheight * 8 / fullheight),

                Framesecondary(size: size, icon: 'assets/icons/injection.svg', title: "Keamanan dan Privasi")
               ]
            ),
          ),
        ),
      )
        );
  }
}