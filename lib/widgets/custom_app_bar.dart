import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF2A2A2A),
                    border: Border.all(color: Color(0xFF3A3A3A), width: 0),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/orangebg_blackman_portrait.png", // change this later to image for user profile
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning,",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      "Darren Fobissie Blese",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
/*
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 0.5),
              ),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
              child: Icon(Icons.settings, color: Colors.white, size: 20),
            ), */
            Row(
              children: [
                SizedBox(width: 12),
                AppBarIconButton(icon: Iconsax.notification),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarIconButton extends StatelessWidget {
  final IconData icon;
  const AppBarIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
