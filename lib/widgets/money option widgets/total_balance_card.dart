import 'package:flutter/material.dart';

class TotalBalanceCard extends StatelessWidget {
  final String balance;
  final String changeText;

  const TotalBalanceCard({
    super.key,
    required this.balance,
    required this.changeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 188, 188, 190),
            Color(0xFF3E6AE1),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.9),
            blurRadius: 14,
            // offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Label ─────────────────────────────
          Text(
            'Total Balance',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 28),

          // Wallet Balance Header Text
          Text(
            balance,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.w700,
              letterSpacing: -2,
            ),
          ),

          const SizedBox(height: 2),

          // Trend Change Sub-Text
          Text(
            changeText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}