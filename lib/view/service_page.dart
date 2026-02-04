import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // same as Home Page background
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double screenWidth = constraints.maxWidth;

            // Responsive flags
            final bool isDesktop = screenWidth > 1000;
            final bool isTablet = screenWidth > 600 && screenWidth <= 1000;

            // Dynamic sizing
            final double padding = isDesktop
                ? 80
                : isTablet
                    ? 50
                    : 20;

            final double titleSize = isDesktop
                ? 40
                : isTablet
                    ? 32
                    : 24;

            final double subtitleSize = isDesktop
                ? 22
                : isTablet
                    ? 18
                    : 15;

            final double cardWidth = isDesktop
                ? screenWidth * 0.25
                : isTablet
                    ? screenWidth * 0.4
                    : screenWidth * 0.9;

            final double cardHeight = isDesktop
                ? 380
                : isTablet
                    ? 340
                    : 280;

            final double iconSize = isDesktop
                ? 60
                : isTablet
                    ? 50
                    : 40;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "What I Do",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: titleSize,
                        color: const Color(0xFF0F3460), // navy accent
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "_______",
                      style: TextStyle(
                        fontSize: subtitleSize,
                        color: const Color(0xFF0F3460),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          ServiceCard(
                            icon: Icons.web,
                            title: "Flutter Web Development",
                            description:
                                "Creating responsive, fast, and visually polished Flutter websites optimised for all screen sizes.",
                            width: cardWidth,
                            height: cardHeight,
                            subtitleSize: subtitleSize,
                            iconSize: iconSize,
                          ),
                          ServiceCard(
                            icon: Icons.phone_android,
                            title: "Application Development",
                            description:
                                "Building robust Android apps with clean MVVM architecture, Firebase, REST APIs, and solid performance.",
                            width: cardWidth,
                            height: cardHeight,
                            subtitleSize: subtitleSize,
                            iconSize: iconSize,
                          ),
                          ServiceCard(
                            icon: Icons.storage_rounded,
                            title: "Firebase Integration",
                            description:
                                "Realtime Database, Authentication, Cloud Firestore, Storage, Crashlytics, and backend integration.",
                            width: cardWidth,
                            height: cardHeight,
                            subtitleSize: subtitleSize,
                            iconSize: iconSize,
                          ),
                          ServiceCard(
                            icon: Icons.palette_rounded,
                            title: "Material UI Design",
                            description:
                                "Designing beautiful, modern, and clean user interfaces following Google’s Material Design system.",
                            width: cardWidth,
                            height: cardHeight,
                            subtitleSize: subtitleSize,
                            iconSize: iconSize,
                          ),
                          ServiceCard(
                            icon: Icons.design_services_rounded,
                            title: "UI with Figma",
                            description:
                                "Creating visually appealing UI/UX mockups and prototypes using Figma for seamless development flow.",
                            width: cardWidth,
                            height: cardHeight,
                            subtitleSize: subtitleSize,
                            iconSize: iconSize,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double width;
  final double height;
  final double subtitleSize;
  final double iconSize;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.width,
    required this.height,
    required this.subtitleSize,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EEF3), // same card tone as Home Page
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F3460).withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: iconSize, color: const Color(0xFF0F3460)), // navy accent
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: subtitleSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0F3460),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: subtitleSize - 2,
                color: const Color(0xFF2C3E50), // deep gray-blue text
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
