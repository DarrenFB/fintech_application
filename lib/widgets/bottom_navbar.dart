import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required Color backgroundColor,
    required int elevation,
    required BottomNavigationBarType type,
    required MaterialAccentColor selectedItemColor,
    required Color unselectedItemColor,
    required bool showSelectedLabels,
    required bool showUnselectedLabels,
    required List<BottomNavigationBarItem> items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 79, 79, 79),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
