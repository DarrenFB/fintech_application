// ignore_for_file: unused_import
import 'package:dio/dio.dart' as dio;
import 'package:fintech_application/models/stock.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:iconsax/iconsax.dart';
// import 'package:stocks/models/stock.dart';
// import 'package:stocks/utils/app_colors.dart';

class MoneyOptionButtons extends StatelessWidget {
  const MoneyOptionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.28;

    return SizedBox(
      width: MediaQuery.of(context).size.width*0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        _buildOptionButton(
          width: buttonWidth,
          icon: Icons.arrow_upward,
          label: "Send",
          onTap: () async {
            final dioClient = dio.Dio();
            dioClient.options.baseUrl = "https://www.alphavantage.co";
            dio.Response response;
            response = await dioClient.get(
              "/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=UY1WEHB55AHTUNFS",
            );

            AlphaVantageDailyResponse data =
                AlphaVantageDailyResponse.fromJson(response.data);
            print(data.meta.information);
            print(data.meta.symbol);
            var open = data.bars.where((e) => e.open > 300);
            for (int i = 0; i < open.length; ++i) {
              print(open.elementAt(i).open);
            }
          },

        ),
        _buildOptionButton(
          width: buttonWidth,
          icon: Icons.swap_horiz,
          label: "Swap",
          onTap: () async {
            final dioClient = dio.Dio();
            dioClient.options.baseUrl = "https://www.alphavantage.co";
            dio.Response response;
            response = await dioClient.get(
              "/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=UY1WEHB55AHTUNFS",
            );
          },
        ),
        _buildOptionButton(
          width: buttonWidth,
          icon: Icons.arrow_downward,
          label: "Receive",
          onTap: () async {
            final dioClient = dio.Dio();
            dioClient.options.baseUrl = "https://www.alphavantage.co";
            dio.Response response;
            response = await dioClient.get(
              "/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=UY1WEHB55AHTUNFS",
            );
          },
        ),
      ],
      ),
    );
  }


  //   Reusable button widget
  Widget _buildOptionButton({
    required double width,
    required IconData icon,
    required String label, required Future<Null> Function() onTap,
  }) {
    return Container(
      width: width,
      height: 75,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/*
onTap: () async {
                final dio = Dio();
                dio.options.baseUrl = "https://www.alphavantage.co";
                Response response;
                response = await dio.get(
                  "/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=VRPSSNJICLSJMM08",
                );
                //print(response.data.toString());

                AlphaVantageDailyResponse data =
                    AlphaVantageDailyResponse.fromJson(response.data);
                print(data.meta.information);
                print(data.meta.symbol);
                var open = data.bars.where((e) => e.open < 300);
                for (int i = 0; i < open.length; ++i) {
                  print(open.elementAt(i).open);
*/