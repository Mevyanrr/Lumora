import '../../data/models/panduan_item.dart';

abstract class PanduanGiziState {}

class PanduanGiziInitial extends PanduanGiziState {}

class PanduanGiziLoaded extends PanduanGiziState {
  final List<PanduanItem> items;

  PanduanGiziLoaded(this.items);
}
