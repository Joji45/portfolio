import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page2.dart';
// import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "My Portfolio",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3460),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "_______",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3460),
                  ),
                ),
                SizedBox(height: 40),
                // card 1 /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                PortfolioCard(
                  title: "Facebook UI Clone",
                  description:
                      "Recreated the Facebook mobile interface through custom widgets and responsive layouts.",
                  explain:
                      "Implemented feed UI, stories layout, and interaction components.",
                  images: [
                    "assets/images/fb_home.png",
                    "assets/images/fb_chat.png",
                    "assets/images/fb_reels.png",
                    "assets/images/fb_start.png",
                    "assets/images/fb_friens.png",
                  ],
                  url: 'https://example.com',
                ),
                SizedBox(height: 40),
                // card 2 ????????????????????????????????????????????????????????????????????????????????????????????????????????????????
                PortfolioCard(
                  title: "Student Management App",
                  description:
                      "Developed a student record management application using local database storage.\n"
                      "Features include adding, editing, deleting, and viewing student details.\n"
                      "Implemented search functionality and clean data organization.",
                  explain: ".",
                  images: [
                    "assets/images/st5.png",
                    "assets/images/st6.png",
                    "assets/images/st3.png",
                    "assets/images/st1.png",
                    "assets/images/st2.png",
                    "assets/images/st4.png",
                  ],
                  url: 'https://example.com',
                ),
                SizedBox(height: 30),
                // card 3 ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????
                PortfolioCard(
                  title: "Multi-Vendor Service Booking App",
                  description:
                      "Built a complete service-booking application with modules for users, vendors, and admin.\n"
                      " Implemented vendor onboarding & verification, slot-based booking, \n"
                      "real-time status tracking (simulated), and an in-app wallet system.\n"
                      "Designed responsive UI with clean navigation and structured code architecture.",
                  explain: "",
                  images: [
                    "assets/images/comming.png",
                    "assets/images/comming.png",
                  ],
                  url: 'https://example.com',
                ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PortfolioCard extends StatefulWidget {
  final String title;
  final String description;
  final String explain;
  final List<String> images;
  final String url;

  const PortfolioCard({
    super.key,
    required this.title,
    required this.description,
    required this.explain,
    required this.images,
    required this.url,
  });

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  int _currentPage = 0;
  late final PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);

    // Auto-slide every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;

      final nextPage =
          _currentPage + 1 == widget.images.length ? 0 : _currentPage + 1;

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // Future<void> _launchUrl() async {
  //   final uri = Uri.parse(widget.url);
  //   if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
  //     throw Exception('Could not launch ${widget.url}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EEF3),
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
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F3460),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 400,
            width: 400,
            child: PageView.builder(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? const Color(0xFF0F3460)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF2C3E50),
              height: 1.5,
            ),
          ),
          Text(
            widget.explain,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF2C3E50),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
