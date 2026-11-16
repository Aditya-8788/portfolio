class SummaryStat {
  const SummaryStat({required this.value, required this.label});

  final String value;
  final String label;
}

class SummaryInfo {
  const SummaryInfo({
    required this.headline,
    required this.paragraphs,
    required this.stats,
  });

  final String headline;
  final List<String> paragraphs;
  final List<SummaryStat> stats;
}
