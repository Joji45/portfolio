import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact_page extends StatefulWidget {
  const Contact_page({super.key});

  @override
  State<Contact_page> createState() => _Contact_pageState();
}

class _Contact_pageState extends State<Contact_page> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _sender() async {
    final String phoneNumber = "+919207962215";
    final String message =
        "Hello, I’m ${nameController.text}. ${messageController.text}";
    final Uri uri = Uri.parse(
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open WhatsApp')),
      );
    }
  }

  void _showWarningPopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EEF3),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: Colors.orange, size: 40),
                  SizedBox(height: 10),
                  Text(
                    "Please fill all fields correctly.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool isDesktop = screenWidth > 1000;
    final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
    final bool isMobile = screenWidth <= 600;

    final double titleSize = isDesktop
        ? 30
        : isTablet
            ? 24
            : 20;
    final double textSize = isDesktop
        ? 18
        : isTablet
            ? 16
            : 14;
    final double iconSize = isDesktop
        ? 28
        : isTablet
            ? 24
            : 20;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 750;
            return SingleChildScrollView(
              padding: EdgeInsets.all(isMobile ? 12 : 24),
              child: Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: isWide ? 1 : 0,
                    child: _FirstContainer(
                      titleSize: titleSize,
                      textSize: textSize,
                      iconSize: iconSize,
                    ),
                  ),
                  SizedBox(width: isWide ? 20 : 0, height: isWide ? 0 : 20),
                  Expanded(
                    flex: isWide ? 1 : 0,
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.all(isMobile ? 10 : 20),
                        child: Column(
                          children: [
                            SecondContainer(
                              hintText: "Your Name",
                              keyboardType: TextInputType.name,
                              controller: nameController,
                            ),
                            const SizedBox(height: 10),
                            SecondContainer(
                              hintText: "Your Email",
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                            ),
                            const SizedBox(height: 10),
                            SecondContainer(
                              hintText: "Subject",
                              keyboardType: TextInputType.text,
                              controller: subjectController,
                            ),
                            const SizedBox(height: 10),
                            SecondContainer(
                              hintText: "Message",
                              keyboardType: TextInputType.text,
                              controller: messageController,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                bool allFilled =
                                    nameController.text.isNotEmpty &&
                                        emailController.text.isNotEmpty &&
                                        subjectController.text.isNotEmpty &&
                                        messageController.text.isNotEmpty;

                                final emailRegex =
                                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                bool isEmailValid = emailRegex
                                    .hasMatch(emailController.text.trim());

                                if (allFilled && isEmailValid) {
                                  _sender();
                                } else {
                                  _showWarningPopup();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0F3460),
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 30 : 50,
                                  vertical: isMobile ? 12 : 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "Send Message",
                                style: TextStyle(
                                  fontSize: isMobile ? 14 : 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// LEFT SECTION
class _FirstContainer extends StatelessWidget {
  final double titleSize;
  final double textSize;
  final double iconSize;

  const _FirstContainer({
    super.key,
    required this.titleSize,
    required this.textSize,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Let's Work Together",
              style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A1A2E))),
          const SizedBox(height: 15),
          Text(
            "I'm always interested in new opportunities and exciting projects. Feel free to reach out.",
            style:
                TextStyle(fontSize: textSize, color: const Color(0xFF2C3E50)),
          ),
          const SizedBox(height: 15),
          ContactListView(
            icon: Icons.email_rounded,
            titleData: "Email",
            descriptionText: "Jojishaji20039@gmail.com",
            url:
                "mailto:jojishaji20039@gmail.com?subject=Hello%20Joji&body=I%20wanted%20to%20contact%20you.",
            iconSize: iconSize,
            textSize: textSize,
          ),
          ContactListView(
            icon: Icons.phone_rounded,
            titleData: "Phone",
            descriptionText: "+91 9207962215",
            url: "tel:+919207962215",
            iconSize: iconSize,
            textSize: textSize,
          ),
          ContactListView(
            icon: Icons.location_on,
            titleData: "Location",
            descriptionText: "Idukki, Kerala, India",
            url: "https://www.google.com/maps/place/Idukki,+Kerala,+India/",
            iconSize: iconSize,
            textSize: textSize,
          ),
        ],
      ),
    );
  }
}

// CONTACT INFO BOX
class ContactListView extends StatelessWidget {
  final IconData icon;
  final String titleData;
  final String descriptionText;
  final String url;
  final double iconSize;
  final double textSize;

  const ContactListView({
    super.key,
    required this.icon,
    required this.titleData,
    required this.descriptionText,
    required this.url,
    required this.iconSize,
    required this.textSize,
  });

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFE8EEF3),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: iconSize + 2,
              backgroundColor: const Color(0xFF0F3460),
              child: Icon(icon, size: iconSize, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleData,
                      style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A1A2E))),
                  const SizedBox(height: 4),
                  Text(descriptionText,
                      style: TextStyle(
                          fontSize: textSize - 2,
                          color: const Color(0xFF2C3E50))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TEXT FIELD
class SecondContainer extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const SecondContainer({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType == TextInputType.text
          ? TextInputType.multiline
          : keyboardType,
      maxLines: keyboardType == TextInputType.text ? null : 1,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFE8EEF3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0F3460)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0F3460), width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}
