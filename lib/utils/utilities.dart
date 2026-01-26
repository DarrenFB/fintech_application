import 'package:fintech_application/models/stock.dart';

class Utilities {
  static (double, bool) calculatorPriceChange(DailyBar data) {
    double opening = data.open;
    double closing = data.close;

    if (opening > closing) {
      return (-((opening - closing) / opening) * 100, false);
    } else {
      return (((closing - opening) / opening) * 100, true);
    }
  }
}