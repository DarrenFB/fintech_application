// ignore_for_file: unused_import

import 'package:fintech_application/widgets/custom_app_bar.dart';
import 'package:fintech_application/widgets/investment%20graph%20section/horizontal_slider_wheel.dart';
import 'package:fintech_application/widgets/money%20option%20widgets/money_option_buttons.dart';
import 'package:fintech_application/widgets/money%20option%20widgets/total_balance_card.dart';
import 'package:fintech_application/widgets/investment%20graph%20section/trend_graph_card.dart';
import 'package:fintech_application/widgets/investment%20graph%20section/trend_section_title.dart';
import 'package:fintech_application/widgets/my%20portfolio%20section/portfolio_preview.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 14,
            right: 14,
            top: 14,
            bottom: 14,
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomAppBar(),
                SizedBox(height: 15, width: MediaQuery.of(context).size.width),
                TotalBalanceCard(
                  balance: '\$24,109.10',
                  changeText: '+ \$1,092.11 (4.53%)',
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MoneyOptionButtons(),
                ),
                SizedBox(height: 14),
                TrendSectionTitle(title: 'Featured Investments'),
                SizedBox(height: 14),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      // Your horizontally scrollable widgets here
                      StockTrendCard(
                        company: 'Apple',
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
                      SizedBox(width: 10),
                      StockTrendCard(
                        company: 'Tesla',
                        ticker: 'TSLA',
                        price: '\$243.18',
                        percentChange: '-1.2%',
                        isPositive: false,
                        data: [
                          FlSpot(0, 6),
                          FlSpot(1, 3),
                          FlSpot(2, 5),
                          FlSpot(3, 4),
                          FlSpot(4, 2),
                        ],
                      ),
                      SizedBox(width: 10),
                      StockTrendCard(
                        company: 'Microsoft',
                        ticker: 'MSFT',
                        price: '\$411.27',
                        percentChange: '+0.9%',
                        isPositive: true,
                        data: [
                          FlSpot(0, 2),
                          FlSpot(1, 3.5),
                          FlSpot(2, 4),
                          FlSpot(3, 4.5),
                          FlSpot(4, 6.5),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                PortfolioPreview(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
          backgroundColor: Colors.black,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.white54,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Stats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: 'Cards',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
