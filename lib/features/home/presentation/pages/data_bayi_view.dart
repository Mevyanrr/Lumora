import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/core/widgets/textfield.dart';
import 'package:lumora/features/home/presentation/pages/home_page.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_event.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_state.dart';
import 'package:lumora/features/kuisioner/services/kuisioner_service.dart';
import 'package:lumora/model/baby_model.dart';

class DataBayiView extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController dateController;
  final TextEditingController bbController;
  final TextEditingController tbController;
  final TextEditingController lingkarKepalaController;

  const DataBayiView({
    super.key,
    required this.nameController,
    required this.dateController,
    required this.bbController,
    required this.tbController,
    required this.lingkarKepalaController,
  });

  @override
  State<DataBayiView> createState() => _DataBayiState();
}

class _DataBayiState extends State<DataBayiView> {
  final List<String> _aktivitasOptions = [
    'Tengkurap',
    'Duduk dengan bantuan',
    'Duduk sendiri',
    'Merangkak',
    'Berdiri dengan pegangan',
    'Merespon terhadap suara',
    'Bayi masih berusia dibawah 2 bulan',
    'Belum bisa semua',
  ];

  bool _dataLoaded = false;
  bool _controllersInitialized = false;

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
          "Data Bayi",
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
          padding: EdgeInsets.only(bottom: sizeheight * 57 / fullheight),
          child: Column(
            children: [
              StreamBuilder(
                stream: KuisionerService().getKuisionerData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final babyData = snapshot.data!;

                    // Isi controller & bloc hanya sekali supaya edit user tidak tertimpa
                    if (!_controllersInitialized) {
                      _controllersInitialized = true;
                      widget.nameController.text = babyData.nama;
                      widget.dateController.text =
                          "${babyData.tanggalLahir.day}/${babyData.tanggalLahir.month}/${babyData.tanggalLahir.year}";
                      widget.bbController.text = babyData.beratBadan.toString();
                      widget.tbController.text = babyData.tinggiBadan.toString();
                      widget.lingkarKepalaController.text =
                          babyData.lingkarKepala.toString();
                    }

                    // Load aktivitas ke bloc sekali saja
                    if (!_dataLoaded) {
                      _dataLoaded = true;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        context.read<KuisionerBloc>().add(
                          SetAktivitasBayi(babyData.kondisi),
                        );
                        // Sync nilai awal ke bloc state juga
                        context.read<KuisionerBloc>().add(IsiNama(babyData.nama));
                        context.read<KuisionerBloc>().add(IsiTglLahir(babyData.tanggalLahir));
                        context.read<KuisionerBloc>().add(IsiBB(babyData.beratBadan));
                        context.read<KuisionerBloc>().add(IsiTB(babyData.tinggiBadan));
                        context.read<KuisionerBloc>().add(IsiLK(babyData.lingkarKepala));
                        context.read<KuisionerBloc>().add(IsiGender(babyData.jenisKelamin));
                      });
                    }
                  }
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: sizewidth * 18 / fullwidth,
                      vertical: sizeheight * 31 / fullheight,
                    ),
                    width: sizewidth * 375 / fullwidth,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(
                        sizewidth * 20 / fullwidth,
                      ),
                      border: Border.all(
                        width: sizewidth * 1 / fullwidth,
                        color: AppColors.txtSecondary,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: sizeheight * 14 / fullheight,
                        horizontal: sizewidth * 24 / fullwidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama Bayi",
                            style: TextStyle(
                              color: AppColors.txtPrimary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: sizewidth * 18 / fullwidth,
                            ),
                          ),
                          SizedBox(height: sizeheight * 9 / fullheight),
                          CustomTxtField(
                            labelText: "Masukkan nama bayi...",
                            controller: widget.nameController,
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
                              fontSize: sizewidth * 18 / fullwidth,
                            ),
                          ),

                          SizedBox(height: sizeheight * 9 / fullheight),

                          CustomTxtField(
                            labelText: "DD/MM/YYYY",
                            controller: widget.dateController,
                            fieldType: CustomFieldType.date,
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: AppColors.txtPrimary,
                            ),
                            onDateSelected: (date) {
                              context.read<KuisionerBloc>().add(
                                IsiTglLahir(date),
                              );
                            },
                          ),
                          SizedBox(height: sizeheight * 12 / fullheight),

                          Text(
                            "Berat badan saat ini (Kg)",
                            style: TextStyle(
                              color: AppColors.txtPrimary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: sizewidth * 18 / fullwidth,
                            ),
                          ),
                          SizedBox(height: sizeheight * 9 / fullheight),
                          CustomTxtField(
                            labelText: "Masukkan berat badan bayi...",
                            fieldType: CustomFieldType.number,
                            controller: widget.bbController,
                            onChanged: (value) {
                              context.read<KuisionerBloc>().add(
                                IsiBB(double.tryParse(value) ?? 0),
                              );
                            },
                          ),
                          SizedBox(height: sizeheight * 12 / fullheight),

                          Text(
                            "Tinggi badan saat ini (Cm)",
                            style: TextStyle(
                              color: AppColors.txtPrimary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: sizewidth * 18 / fullwidth,
                            ),
                          ),
                          SizedBox(height: sizeheight * 9 / fullheight),
                          CustomTxtField(
                            labelText: "Masukkan tinggi badan bayi...",
                            fieldType: CustomFieldType.number,
                            controller: widget.tbController,
                            onChanged: (value) {
                              context.read<KuisionerBloc>().add(
                                IsiTB(double.tryParse(value) ?? 0),
                              );
                            },
                          ),
                          SizedBox(height: sizeheight * 12 / fullheight),

                          Text(
                            "Lingkar kepala saat ini (Cm)",
                            style: TextStyle(
                              color: AppColors.txtPrimary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: sizewidth * 18 / fullwidth,
                            ),
                          ),
                          SizedBox(height: sizeheight * 9 / fullheight),
                          CustomTxtField(
                            labelText: "Jika belum tahu dapat dilewatkan...",
                            fieldType: CustomFieldType.number,
                            controller: widget.lingkarKepalaController,
                            onChanged: (value) {
                              context.read<KuisionerBloc>().add(
                                IsiLK(double.tryParse(value) ?? 0),
                              );
                            },
                          ),

                          SizedBox(height: sizeheight * 24 / fullheight),
                          Text(
                            "Jenis Kelamin",
                            style: TextStyle(
                              color: AppColors.txtPrimary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: sizewidth * 18 / fullwidth,
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
                                  Text(
                                    'Laki-laki',
                                    style: TextStyle(
                                      color: AppColors.txtPrimary,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: sizewidth * 16 / fullwidth,
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
                                  Text(
                                    'Perempuan',
                                    style: TextStyle(
                                      color: AppColors.txtPrimary,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: sizewidth * 16 / fullwidth,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),

                          SizedBox(height: sizeheight * 28 / fullheight),
                          Text(
                            "Saat ini bayi sudah bisa?",
                            style: TextStyle(
                              color: AppColors.txtPrimary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: sizewidth * 18 / fullwidth,
                            ),
                          ),
                          Text(
                            "Boleh pilih lebih dari satu",
                            style: TextStyle(
                              color: AppColors.txtSecondary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: sizewidth * 12 / fullwidth,
                            ),
                          ),

                          SizedBox(height: sizeheight * 8 / fullheight),

                          BlocBuilder<KuisionerBloc, KuisionerState>(
                            builder: (context, state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _aktivitasOptions.map((option) {
                                  final isSelected = state.aktivitasBayi.contains(option);
                                  return InkWell(
                                    onTap: () {
                                      context.read<KuisionerBloc>().add(
                                        ToggleAktivitasBayi(option),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: sizeheight * 2 / fullheight,
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: isSelected,
                                            activeColor: AppColors.radio,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            onChanged: (_) {
                                              context.read<KuisionerBloc>().add(
                                                ToggleAktivitasBayi(option),
                                              );
                                            },
                                          ),
                                          SizedBox(width: sizewidth * 4 / fullwidth),
                                          Expanded(
                                            child: Text(
                                              option,
                                              style: TextStyle(
                                                color: AppColors.txtPrimary,
                                                fontFamily: 'Poppins',
                                                fontWeight: isSelected
                                                    ? FontWeight.w500
                                                    : FontWeight.w400,
                                                fontSize: sizewidth * 16 / fullwidth,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              ButtonMedium(
                text: "Edit Data",
                width: sizewidth * 327 / fullwidth,
                height: sizeheight * 45 / fullheight,
                backgroundColor: AppColors.txtPrimary,
                borderColor: AppColors.txtPrimary,
                onTap: () async {
                  final finalState = context.read<KuisionerBloc>().state;
                  final User? user = FirebaseAuth.instance.currentUser;
                  BabyModel babyModel = BabyModel(
                    nama: finalState.nama,
                    tanggalLahir: finalState.tanggalLahir ?? DateTime.now(),
                    jenisKelamin: finalState.gender ?? '',
                    beratBadan: finalState.bb,
                    tinggiBadan: finalState.tb,
                    lingkarKepala: finalState.lingkarKepala,
                    riwayatKesehatan: finalState.kondisiBayi,
                    kontrol: finalState.pilKontrol,
                    kondisi: finalState.aktivitasBayi,
                    createdAt: DateTime.now(),
                    alamat: '',
                    latitude: 0.0,
                    longitude: 0.0,
                  );
                  await KuisionerService().updateDataBayi(babyModel);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                },
                radius: 15,
                txColor: AppColors.background,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
