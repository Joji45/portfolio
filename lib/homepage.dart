import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_application_1/view/main_page.dart';
import 'package:flutter_application_1/view/pdfread.dart';
import 'package:flutter_application_1/view/portfolio_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isWide = width > 900;
    final bool isTablet = width > 600 && width <= 900;

    final double titleFont = width * 0.04 > 30 ? 30 : width * 0.05;
    final double subtitleFont = width * 0.03 > 22 ? 22 : width * 0.045;
    final double paragraphFont = width * 0.025 > 18 ? 18 : width * 0.04;
    final double imageSize = width * 0.25 > 180 ? 180 : width * 0.35;
    final double padding = width * 0.05 > 40 ? 40 : width * 0.08;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // light white-blue background
      body: SingleChildScrollView(
        padding: isWide
            ? EdgeInsets.only(
                left: padding,
                top: padding,
                bottom: padding,
                right: 0, // remove right padding
              )
            : EdgeInsets.all(padding), // keep padding for small screens
        child: Flex(
          direction: isWide ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            // Left Section
            Flexible(
              flex: isWide ? 1 : 0,
              child: Padding(
                padding: EdgeInsets.all(padding / 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: isWide
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    RichText(
                      textAlign: isWide ? TextAlign.left : TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Hi, I'm ",
                          style: TextStyle(
                            fontSize: titleFont,
                            color: const Color(0xFF1A1A2E), // dark navy
                          ),
                        ),
                        TextSpan(
                          text: "Joji Shaji",
                          style: TextStyle(
                            fontSize: titleFont,
                            color: const Color(0xFF0F3460), // royal navy accent
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 8),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText(
                          "I'm a Flutter Developer",
                          textStyle: TextStyle(
                            color: const Color(0xFF16213E), // navy tone
                            fontSize: subtitleFont,
                            fontWeight: FontWeight.w500,
                          ),
                          speed: const Duration(milliseconds: 80),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "I build responsive, beautiful, and efficient Flutter applications.",
                      textAlign: isWide ? TextAlign.left : TextAlign.center,
                      style: TextStyle(
                        fontSize: paragraphFont,
                        color: const Color(0xFF2C3E50), // deep gray-blue text
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Wrap(
                      alignment:
                          isWide ? WrapAlignment.start : WrapAlignment.center,
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScaffold(
                                  initialIndex: 2,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF0F3460), // navy primary
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.06,
                              vertical: width * 0.02,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                          ),
                          child: Text(
                            "View My Works",
                            style: TextStyle(fontSize: paragraphFont - 2),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfReaderPage(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFFE8EEF3), // light silver-gray
                            foregroundColor:
                                const Color(0xFF1A1A2E), // dark navy text
                            side: const BorderSide(
                                color: Color(0xFF0F3460)), // border
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.06,
                              vertical: width * 0.02,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 1,
                          ),
                          child: Text(
                            "Get My Resume",
                            style: TextStyle(fontSize: paragraphFont - 2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            if (isWide) const SizedBox(width: 60),

            // Right Section
            Flexible(
              flex: isWide ? 1 : 0,
              child: Center(
                child: Container(
                  width: isWide
                      ? 460
                      : isTablet
                          ? 320
                          : width * 0.85,
                  // height: isWide ? 600 : null,
                  margin: EdgeInsets.only(top: isWide ? 0 : 40),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8EEF3), // white card
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(width * 0.06),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Replace this part inside the Column:
                      const SizedBox(height: 10),

                      Center(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/dp.jpg',
                            width: imageSize * 1.7, // increased size
                            height: imageSize * 1.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Joji Shaji",
                        style: TextStyle(
                          fontSize: paragraphFont + 2,
                          color: const Color(0xFF1A1A2E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Front-end Flutter Developer",
                        style: TextStyle(
                          color: const Color(0xFF0F3460),
                          fontSize: paragraphFont,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 18,
                        runSpacing: 10,
                        children: [
                          _buildIcon(
                            FontAwesomeIcons.github,
                            const Color(0xFF0F3460),
                            "https://github.com/Joji45/",
                          ),
                          _buildIcon(
                            FontAwesomeIcons.linkedin,
                            const Color(0xFF16213E),
                            "https://www.linkedin.com/in/joji-shaji-7454a0305?utm_source=share_via&utm_content=profile&utm_medium=member_android",
                          ),
                          _buildIcon(
                            FontAwesomeIcons.instagram,
                            const Color(0xFF1A1A2E),
                            "https://www.instagram.com/joji_shaji_?utm_source=qr&igsh=cXM1MDdiZWtvbHd5",
                          ),
                          _buildIcon(
                            FontAwesomeIcons.facebook,
                            const Color(0xFF2C3E50),
                            "https://www.facebook.com/yourprofile",
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 150,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, Color color, String url) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: const Color(0xFFE8EEF3),
      child: IconButton(
        icon: FaIcon(icon, color: color, size: 30),
        onPressed: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
      ),
    );
  }
}
