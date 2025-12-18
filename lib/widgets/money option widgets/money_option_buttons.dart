import 'package:flutter/material.dart';

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
        ),
        _buildOptionButton(
          width: buttonWidth,
          icon: Icons.swap_horiz,
          label: "Swap",
        ),
        _buildOptionButton(
          width: buttonWidth,
          icon: Icons.arrow_downward,
          label: "Receive",
        ),
      ],
      ),
    );
  }


  //   Reusable button widget
  Widget _buildOptionButton({
    required double width,
    required IconData icon,
    required String label,
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