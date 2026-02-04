import 'package:flutter/material.dart';

class About_page extends StatefulWidget {
  const About_page({super.key});

  @override
  State<About_page> createState() => _About_pageState();
}

class _About_pageState extends State<About_page> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isWide = width > 900;
    final bool isTablet = width > 600 && width <= 900;

    final double titleFont = isWide
        ? 32
        : isTablet
            ? 26
            : 22;
    final double paragraphFont = isWide
        ? 20
        : isTablet
            ? 17
            : 14;
    final double padding = isWide
        ? 40
        : isTablet
            ? 25
            : 16;
    final double chipFont = isWide
        ? 16
        : isTablet
            ? 14
            : 12;
    final double chipPadding = isWide
        ? 12
        : isTablet
            ? 10
            : 8;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // same as Home Page background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(padding),
          child: Flex(
            direction: isWide ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              // LEFT SECTION
              Flexible(
                flex: isWide ? 1 : 0,
                child: Padding(
                  padding: EdgeInsets.all(padding / 2),
                  child: Column(
                    crossAxisAlignment: isWide
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Who I Am",
                        style: TextStyle(
                          fontSize: titleFont,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3460), // royal navy accent
                        ),
                        textAlign: isWide ? TextAlign.left : TextAlign.center,
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        "I’m Joji Shaji, a passionate Flutter developer and freelancer with a background in Human Resource Management (Diploma) and a Bachelor’s degree in Computer Applications (BCA). I specialize in building modern, user-focused mobile applications with clean UI and smooth functionality.",
                        style: TextStyle(
                          fontSize: paragraphFont,
                          height: 1.6,
                          color: const Color(0xFF2C3E50), // dark gray-blue text
                        ),
                        textAlign: isWide ? TextAlign.left : TextAlign.center,
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        "With strong skills in Flutter, Dart, C, and UI/UX design, I enjoy transforming creative ideas into fully functional digital products. I’m currently expanding my expertise in Flutter development, exploring advanced techniques for building scalable, high-performance apps.",
                        style: TextStyle(
                          fontSize: paragraphFont,
                          height: 1.6,
                          color: const Color(0xFF2C3E50),
                        ),
                        textAlign: isWide ? TextAlign.left : TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: isWide ? 40 : 0, height: isWide ? 0 : 40),

              // RIGHT SECTION
              Flexible(
                flex: isWide ? 1 : 0,
                child: Padding(
                  padding: EdgeInsets.all(padding / 2),
                  child: Column(
                    crossAxisAlignment: isWide
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      Text(
                        "My Skills",
                        style: TextStyle(
                          fontSize: titleFont,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3460),
                        ),
                        textAlign: isWide ? TextAlign.left : TextAlign.center,
                      ),
                      SizedBox(height: padding / 2),
                      Wrap(
                        alignment:
                            isWide ? WrapAlignment.start : WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _Outlayer(
                              text: "Dart programming",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "Flutter",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "C Programming",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "App deployment",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "Local storage",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "Material & Cupertino Design",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: " Figma to Flutter UI conversion",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "State management",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "Provider",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "Bloc", font: chipFont, pad: chipPadding),
                          _Outlayer(
                              text: " Animations and motion design",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "Responsive UI development",
                              font: chipFont,
                              pad: chipPadding),
                        ],
                      ),
                      SizedBox(height: padding),
                      Text(
                        "Tools",
                        style: TextStyle(
                          fontSize: titleFont,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3460),
                        ),
                        textAlign: isWide ? TextAlign.left : TextAlign.center,
                      ),
                      SizedBox(height: padding / 2),
                      Wrap(
                        alignment:
                            isWide ? WrapAlignment.start : WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _Outlayer(
                              text: "Figma", font: chipFont, pad: chipPadding),
                          _Outlayer(
                              text: "Git", font: chipFont, pad: chipPadding),
                          _Outlayer(
                              text: "AWS", font: chipFont, pad: chipPadding),
                          _Outlayer(
                              text: "Hostinger",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "VS Code",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "Firebase Console ",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "Flutter DevTools",
                              font: chipFont,
                              pad: chipPadding),
                          _Outlayer(
                              text: "Postman",
                              font: chipFont,
                              pad: chipPadding),
                        ],
                      ),
                      const SizedBox(
                        height: 130,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Outlayer extends StatelessWidget {
  final String text;
  final double font;
  final double pad;

  const _Outlayer({
    super.key,
    required this.text,
    required this.font,
    required this.pad,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: pad, horizontal: pad * 1.6),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460), // navy accent from Home Page button
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F3460).withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: font,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
