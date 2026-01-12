import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/kuisioner/presentation/widgets/top_container.dart';
import 'package:lumora/core/widgets/textfield.dart';

class Page1View extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController dateController;

  const Page1View({
    super.key,
    required this.nameController,
    required this.dateController
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
        child: Column(
          children: [
            TopContainer(
              stepPage: "1 / 4",
              image: "assets/images/kuisioner-1.png",
            ),

            SizedBox(height: sizeheight* 20/fullheight),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Nama Bayi"),
                SizedBox(height: sizeheight* 8/fullheight),
                CustomTxtField(
                  labelText: "Masukkan nama bayi...",
                  controller: nameController,
                  
                ),
                Text("Tanggal Lahir"),

                SizedBox(height: sizeheight* 8/fullheight),

                CustomTxtField(
                  labelText: "DD/MM/YYYY",
                  controller: dateController,
                  fieldType: CustomFieldType.date,
                  
                  suffixIcon: Icon(Icons.calendar_month, color: AppColors.txtPrimary, weight: 24,),
                ),

                SizedBox(height: sizeheight* 15/fullheight),

                const Text("Jenis Kelamin"),

        BlocBuilder<GenderBloc, GenderState>(
          builder: (context, state) {
            return Row(
              children: [
                Radio<String>(
                  value: 'L',
                  groupValue: state.selectedGender,
                  onChanged: (value) {
                    context
                        .read<GenderBloc>()
                        .add(GenderSelected(value!));
                  },
                ),
                const Text('Laki-laki'),

                Radio<String>(
                  value: 'P',
                  groupValue: state.selectedGender,
                  onChanged: (value) {
                    context
                        .read<GenderBloc>()
                        .add(GenderSelected(value!));
                  },
                ),
                const Text('Perempuan'),
              ],
            );
          },
        ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
