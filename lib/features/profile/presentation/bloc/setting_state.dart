import 'package:lumora/features/profile/domain/models/setting_item.dart';

abstract class SettingState {}

class SettingStateiInitial extends SettingState {}

class SettingLoaded extends SettingState {
  final List<SettingItem> items;

 SettingLoaded(this.items);
}
