/*
class AlphaVantageDailyResponse {
  final MetaData meta;
  final List<DailyBar> bars; // sorted newest -> oldest
  AlphaVantageDailyResponse({required this.meta, required this.bars});
  factory AlphaVantageDailyResponse.fromJson(Map<String, dynamic> json) {
    final metaJson = (json['Meta Data'] as Map).cast<String, dynamic>();
    final seriesJson = (json['Time Series (Daily)'] as Map)
        .cast<String, dynamic>();
    final bars = seriesJson.entries.map((e) {
      final dateStr = e.key; // "2025-12-19"
      final day = (e.value as Map).cast<String, dynamic>();
      return DailyBar.fromAlphaVantage(dateStr, day);
    }).toList();
    // Sort newest -> oldest (string compare works for YYYY-MM-DD)
    bars.sort((a, b) => b.date.compareTo(a.date));
    return AlphaVantageDailyResponse(
      meta: MetaData.fromJson(metaJson),
      bars: bars,
    );
  }
  static AlphaVantageDailyResponse fromRawJson(String raw) =>
      AlphaVantageDailyResponse.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
}
*/