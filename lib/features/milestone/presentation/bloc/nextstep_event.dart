abstract class NextstepEvent {}

class FetchNextstep extends NextstepEvent {
  final String activityTitle;
  final String activityDescription;
  final String activityFungsi;
  final String activityAcvtotal;

  FetchNextstep({
    required this.activityTitle,
    required this.activityDescription,
    required this.activityFungsi,
    required this.activityAcvtotal,
  });
}
