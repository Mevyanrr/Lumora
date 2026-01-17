enum PanduanIconType {
  checklist,
  warning,
}

class PanduanItem {
  final PanduanIconType iconType;
  final String text;

  PanduanItem({
    required this.iconType,
    required this.text,
  });
}
