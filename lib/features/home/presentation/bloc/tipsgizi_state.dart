import 'package:lumora/features/home/data/models/tipsgizi_item.dart';


abstract class TipsGiziState {}

class TipsGiziInitial extends TipsGiziState {}

class TipsGiziLoaded extends TipsGiziState {
  final List<TipsGiziItem> items;

  TipsGiziLoaded(this.items);
}
