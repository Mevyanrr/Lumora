import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/navbar.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_event.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_state.dart';
import 'package:lumora/features/kuisioner/presentation/widgets/top_container.dart';
import 'package:lumora/core/widgets/textfield.dart';

class Page1View extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController dateController;

  const Page1View({
    super.key,
    required this.nameController,
    required this.dateController,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: sizeheight * 77 / fullheight),
          child: Column(
            children: [
              TopContainer(
                stepPage: "1 / 4",
                image: "assets/images/kuisioner-1.png",
              ),

              SizedBox(height: sizeheight * 30 / fullheight),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Bayi",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: sizeheight * 9 / fullheight),
                    CustomTxtField(
                      labelText: "Masukkan nama bayi...",
                      controller: nameController,
                      onChanged: (value) {
                        context.read<KuisionerBloc>().add(IsiNama(value));
                      },
                    ),
                    SizedBox(height: sizeheight * 12 / fullheight),
                    Text(
                      "Tanggal Lahir",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: sizeheight * 9 / fullheight),

                    CustomTxtField(
                      labelText: "DD/MM/YYYY",
                      controller: dateController,
                      fieldType: CustomFieldType.date,
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.txtPrimary,
                      ),
                      onDateSelected: (date) {
                        context.read<KuisionerBloc>().add(IsiTglLahir(date));
                      },
                    ),

                    SizedBox(height: sizeheight * 24 / fullheight),

                    const Text(
                      "Jenis Kelamin",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),

                    BlocBuilder<KuisionerBloc, KuisionerState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Radio<String>(
                              value: 'L',
                              groupValue: state.gender,
                              onChanged: (value) {
                                context.read<KuisionerBloc>().add(
                                  IsiGender(value!),
                                );
                              },
                            ),

                            SizedBox(width: sizewidth * 8 / fullwidth),
                            Text(
                              'Laki-laki',
                              style: TextStyle(
                                color: AppColors.txtPrimary,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),

                            SizedBox(width: sizewidth * 24 / fullwidth),

                            Radio<String>(
                              value: 'P',
                              groupValue: state.gender,
                              onChanged: (value) {
                                context.read<KuisionerBloc>().add(
                                  IsiGender(value!),
                                );
                              },
                            ),
                            SizedBox(width: sizewidth * 8 / fullwidth),
                            Text(
                              'Perempuan',
                              style: TextStyle(
                                color: AppColors.txtPrimary,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(selectedItem: 0),
    );
  }
}
