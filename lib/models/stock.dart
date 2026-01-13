import 'dart:convert';

class Stock {}

class MetaData {
  final String information;
  final String symbol;
  final String lastRefreshed;
  final String outputSize;
  final String timeZone;

  MetaData({
    required this.information,
    required this.symbol,
    required this.lastRefreshed,
    required this.outputSize,
    required this.timeZone,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      information: json['1. Information'] as String,
      symbol: json['2. Symbol'] as String,
      lastRefreshed: json['3. Last Refreshed'] as String,
      outputSize: json['4. Output Size'] as String,
      timeZone: json['5. Time Zone'] as String,
    );
  }
}



class DailyBar {
  final String date;
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;

  DailyBar({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory DailyBar.fromJson(String date, Map<String, dynamic> json) {
    double parseD(String key) => double.parse(json[key] as String);
    int parseI(String key) => int.parse(json[key] as String);


    return DailyBar(
      date: date,
      open: parseD('1. open'),
      high: parseD('2. high'),
      low: parseD('3. low'),
      close: parseD('4. close'),
      volume: parseI('5. volume'),
    );
  }
}

class AlphaVantageDailyResponse {
  final MetaData meta;
  final List<DailyBar> bars; // sorted newest -> oldest

  AlphaVantageDailyResponse({
    required this.meta,
    required this.bars,
  });

  factory AlphaVantageDailyResponse.fromJson(Map<String, dynamic> json) {
    final meta = MetaData.fromJson(json['Meta Data'] as Map<String, dynamic>);
    final timeSeries = json['Time Series (Daily)'] as Map<String, dynamic>;

    final bars = timeSeries.entries.map((entry) {
      final date = entry.key; // 2025-12-19
      final data = entry.value as Map<String, dynamic>;
      return DailyBar.fromJson(date, data);
    }).toList();

    bars.sort((a, b) => b.date.compareTo(a.date)); // newest -> oldest
    return AlphaVantageDailyResponse(
      meta: meta,
      bars: bars,
    );
  }
  
  static AlphaVantageDailyResponse fromRawJson(String str) =>
    AlphaVantageDailyResponse.fromJson(
        jsonDecode(str) as Map<String, dynamic>
    );
}


