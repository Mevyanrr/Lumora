enum CatatanType {
  info,
  warning,
}

class CatatanItem {
  final String text;
  final CatatanType type;

  CatatanItem({
    required this.text,
    required this.type,
  });
}
