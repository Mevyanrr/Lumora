enum PeriodeAktivitas {
  bulanLalu,
  bulanIni,
}

class Aktivitas {
  final String title;
  final String description;
  final String fungsi;
  final String actvtotal;
  final int doneCount;
  final int totalCount;
  final bool isCompleted;
  final PeriodeAktivitas periode;

  Aktivitas({
    required this.title,
    required this.description,
    required this.fungsi,
    required this.actvtotal,
    required this.doneCount,
    required this.totalCount,
    required this.isCompleted,
    required this.periode,
  });
}
