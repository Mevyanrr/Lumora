import 'package:lumora/features/profile/domain/models/informasi_bayi_item.dart';

abstract class InformasibayiState {}

class InformasibayiInitial extends InformasibayiState {}

class InformasibayiLoaded extends InformasibayiState {
  final List<InformasiBayiItem> items;

 InformasibayiLoaded(this.items);
}
