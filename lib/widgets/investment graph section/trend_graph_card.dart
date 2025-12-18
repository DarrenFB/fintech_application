// ignore_for_file: unused_import

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