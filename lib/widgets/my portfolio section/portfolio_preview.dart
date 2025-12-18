import 'package:flutter/material.dart';

class PortfolioPreview extends StatelessWidget {
  const PortfolioPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ─────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'My Portfolio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'View All',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // ── Portfolio Card ─────────────────────
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              PortfolioItem(
                Image.asset('assets/images/amazon_icon.png'),
                companyName: 'Amazon',
                ticker: 'AMZN',
                value: '\$132.00',
                percentChange: '+9.054%',
                isPositive: true,
              ),
              /*
              const Divider(color: Colors.white10, height: 1),
              PortfolioItem(
                Image.asset('assets/images/apple_logo.png'),
                companyName: 'Apple',
                ticker: 'AAPL',
                value: '\$523.11',
                percentChange: '12',
                isPositive: false,
              ),
              const Divider(color: Colors.white10, height: 1),
              PortfolioItem(
                Image.asset('assets/images/tesla_logo.png'),
                companyName: 'Tesla',
                ticker: 'TSLA',
                value: '\$243.18',
                percentChange: '-1.2%',
                isPositive: false,
                
              ),*/
            ],
          ),
        ),
      ],
    );
  }
}

class PortfolioItem extends StatelessWidget {
  final Widget logo;
  final String companyName;
  final String ticker;
  final String value;
  final String percentChange;
  final bool isPositive;

  const PortfolioItem(
    this.logo, {
    super.key,
    required this.companyName,
    required this.ticker,
    required this.value,
    required this.percentChange,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          // ── Logo ────────────────────────────
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF2A2A2A),
            child: logo,
          ),

          const SizedBox(width: 12),

          // ── Company Name + Ticker ────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  ticker,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // ── Value + Percentage ───────────────
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                percentChange,
                style: TextStyle(
                  color: isPositive
                      ? Colors.blueAccent
                      : Colors.redAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}