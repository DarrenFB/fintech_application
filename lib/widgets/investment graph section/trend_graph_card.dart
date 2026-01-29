// ignore_for_file: unused_import
import 'package:fintech_application/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fintech_application/models/stock.dart';
import 'package:fintech_application/utils/app_colors.dart';

class StockDisplay extends StatefulWidget {
  const StockDisplay({
    super.key,
    required this.name,
    required this.symbol,
    required this.data,
    // this.price = "\$523.13",
    // this.growth = "+12%",
    // this.isUp = true,
  });

  final String name;
  final String symbol;
  final AlphaVantageDailyResponse data;
  // final String price;
  // final String growth;
  // final bool isUp;

  @override
  State<StockDisplay> createState() => _StockDisplayState();
}

class _StockDisplayState extends State<StockDisplay> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
    AppColors.contentColorRed,
    AppColors.contentColorPink,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.only(bottom: 1, right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.cardDarkBackground,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
            child: AspectRatio(aspectRatio: 0.9, child: LineChart(avgData())),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              widget.name,
              style: TextStyle(color: AppColors.primaryText, fontSize: 18),
            ),
          ),
          Positioned(
            top: 34,
            left: 10,
            child: Text(
              widget.symbol,
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 10,
            child: Row(
              spacing: 5,
              children: [
                Text(
                  widget.data.bars.first.close.toString(),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  Utilities.calculatorPriceChange(widget.data.bars.first).$2
                      ? "+${Utilities.calculatorPriceChange(widget.data.bars.first).$1.toStringAsFixed(2)}%"
                      : "-${Utilities.calculatorPriceChange(widget.data.bars.first).$1.toStringAsFixed(2)}%",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(show: false, drawHorizontalLine: false),
      clipData: FlClipData(top: false, bottom: true, left: true, right: true),
      titlesData: FlTitlesData(
        show: false,
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 4,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 1.44),
            FlSpot(1, 1),
            FlSpot(1.8, 1.5),
            FlSpot(4, 2.60),
            FlSpot(6, 2.0),
            FlSpot(8, 1.94),
            FlSpot(11, 3.6),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: Utilities.calculatorPriceChange(widget.data.bars.first).$2
                ? [
                    ColorTween(
                      begin: gradientColors[0],
                      end: gradientColors[1],
                    ).lerp(0.2)!,
                    ColorTween(
                      begin: gradientColors[0],
                      end: gradientColors[1],
                    ).lerp(0.2)!,
                  ]
                : [
                    ColorTween(
                      begin: gradientColors[2],
                      end: gradientColors[3],
                    ).lerp(0.2)!,
                    ColorTween(
                      begin: gradientColors[2],
                      end: gradientColors[3],
                    ).lerp(0.2)!,
                  ],
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: Utilities.calculatorPriceChange(widget.data.bars.first).$2
                  ? [
                      ColorTween(
                        begin: gradientColors[0].withAlpha(50),
                        end: gradientColors[1].withAlpha(50),
                      ).lerp(0.2)!.withValues(alpha: 0.1),
                      ColorTween(
                        begin: gradientColors[0].withAlpha(50),
                        end: gradientColors[1].withAlpha(50),
                      ).lerp(0.2)!.withValues(alpha: 0.1),
                    ]
                  : [
                      ColorTween(
                        begin: gradientColors[2].withAlpha(50),
                        end: gradientColors[3].withAlpha(50),
                      ).lerp(0.2)!.withValues(alpha: 0.1),
                      ColorTween(
                        begin: gradientColors[2].withAlpha(50),
                        end: gradientColors[3].withAlpha(50),
                      ).lerp(0.2)!.withValues(alpha: 0.1),
                    ],
            ),
          ),
        ),
      ],
    );
  }
}

// class StockDisplayRow extends StatelessWidget {
//   const StockDisplayRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Row(
//         spacing: 5,
//         children: [
//           StockDisplay(name: "Apple", symbol: "AAPL", isUp: true),

//           StockDisplay(name: "Apple", symbol: "AAPL", isUp: true),

//           StockDisplay(name: "Apple", symbol: "AAPL", isUp: true),
//         ],
//       ),
//     );
//   }
// }

/*
import 'package:fintech_application/widgets/investment%20graph%20section/horizontal_slider_wheel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fintech_application/widgets/investment%20graph%20section/trend_graph_card.dart';

class StockTrendSlider extends StatelessWidget {
  const StockTrendSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(width: 16),
          StockTrendCard(
            company: 'Apple Inc',
            ticker: 'AAPL',
            price: '\$189.32',
            percentChange: '+2.4%',
            isPositive: true,
            data: [
              FlSpot(0, 3),
              FlSpot(1, 4),
              FlSpot(2, 3.5),
              FlSpot(3, 5),
              FlSpot(4, 6),
            ],
          ),
          SizedBox(width: 16),
          StockTrendCard(
            company: 'Tesla',
            ticker: 'TSLA',
            price: '\$243.18',
            percentChange: '-1.2%',
            isPositive: false,
            data: [
              FlSpot(0, 6),
              FlSpot(1, 5),
              FlSpot(2, 3),
              FlSpot(3, 4),
              FlSpot(4, 7),
            ],
          ),
          SizedBox(width: 16),
          StockTrendCard(
            company: 'Microsoft',
            ticker: 'MSFT',
            price: '\$411.27',
            percentChange: '+0.9%',
            isPositive: true,
            data: [
              FlSpot(0, 2),
              FlSpot(1, 3),
              FlSpot(2, 4),
              FlSpot(3, 4.5),
              FlSpot(4, 5),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
*/
