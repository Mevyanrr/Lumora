abstract class ProfileEvent {}

class ProfileMenuTapped extends ProfileEvent {
  final int index;

  ProfileMenuTapped(this.index);
}
