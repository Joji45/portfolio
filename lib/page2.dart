import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.home_filled, 'label': 'Home'},
      {'icon': Icons.person_3_sharp, 'label': 'About'},
      {'icon': Icons.badge_rounded, 'label': 'Portfolio'},
      {'icon': Icons.settings, 'label': 'Service'},
      {'icon': Icons.email, 'label': 'Contact'},
    ];

    final screenWidth = MediaQuery.of(context).size.width;

    final bool isDesktop = screenWidth > 1000;
    final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
    final bool isMobile = screenWidth <= 600;

    final double horizontalMargin = isDesktop
        ? 100
        : isTablet
            ? 50
            : 10;

    final double verticalMargin = isDesktop
        ? 25
        : isTablet
            ? 20
            : 10;

    final double barPadding = isDesktop
        ? 25
        : isTablet
            ? 18
            : 10;

    final double iconSize = isDesktop
        ? 32
        : isTablet
            ? 26
            : 22;

    final double textSize = isDesktop
        ? 14
        : isTablet
            ? 12
            : 10;

    final double spacing = isDesktop
        ? 25
        : isTablet
            ? 20
            : 10;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
          vertical: verticalMargin,
        ),
        padding: EdgeInsets.symmetric(
          vertical: barPadding,
          horizontal: isDesktop
              ? 40
              : isTablet
                  ? 25
                  : 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE8EEF3), // light container background
          borderRadius: BorderRadius.circular(isDesktop ? 50 : 30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F3460)
                  .withOpacity(0.15), // subtle navy shadow
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (index) {
            final isActive = index == currentIndex;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing / 4),
              child: GestureDetector(
                onTap: () => onTabSelected(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 6 : 10,
                    horizontal: isMobile ? 8 : 14,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF0F3460) // active navy
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        items[index]['icon'] as IconData,
                        color: isActive
                            ? Colors.white
                            : const Color(0xFF2C3E50), // inactive text color
                        size: iconSize,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        items[index]['label'] as String,
                        style: TextStyle(
                          color:
                              isActive ? Colors.white : const Color(0xFF2C3E50),
                          fontSize: textSize,
                          fontWeight:
                              isActive ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
