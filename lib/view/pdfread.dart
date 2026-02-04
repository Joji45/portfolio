import 'package:flutter/material.dart';

class PdfReaderPage extends StatelessWidget {
  const PdfReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: AspectRatio(
            aspectRatio: 210 / 297, // A4 ratio
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(32), // PDF-like margins
              child: const SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "JOJI SHAJI",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text("Idukki, Kerala"),
                      Text("Phone: +91 92079 62215"),
                      Text("Email: jojishaji20039@gmail.com"),
                      SizedBox(height: 16),
                      Text(
                        "PROFILE SUMMARY",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Junior Flutter Developer with hands-on experience in building mobile applications using Flutter and Dart. \n"
                        "Skilled in UI development, MVVM architecture, and state management using BLoC and Provider. \n"
                        "Currently working as a Flutter Intern at Luminar Technolab (from June 2025), developing scalable and \n "
                        "maintainable application features.",
                      ),
                      SizedBox(height: 16),
                      Text(
                        "SKILLS",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text("• Mobile Development: Flutter, Dart"),
                      Text("• State Management: BLoC, Provider"),
                      Text("• Architecture: MVVM"),
                      Text(
                          "• Tools: Android Studio, VS Code, Git, Firebase (Basic), Hostinger, Figma (Basic)"),
                      Text(
                          "• Soft Skills: Problem-Solving, Communication, Time Management, Team Collaboration"),
                      SizedBox(height: 16),
                      Text(
                        "EXPERIENCE",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Flutter Intern — Luminar Technolab, Kochi (June 2025 – Present)",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "• Building mobile application interfaces using Flutter & Dart."),
                      Text(
                          "• Utilizing MVVM architecture for clean, scalable code structures."),
                      Text(
                          "• Implementing BLoC and Provider for efficient state management."),
                      Text("• Debugging and optimizing app performance."),
                      SizedBox(height: 16),
                      Text(
                        "PROJECTS",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Multi-Vendor Service Booking App (Flutter)",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "• Developed a multi-vendor booking system with user, vendor, and admin modules."),
                      Text(
                          "• Implemented slot booking, vendor verification, real-time tracking simulation, and in-app wallet."),
                      SizedBox(height: 8),
                      Text(
                        "Facebook UI Clone (Flutter)",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "• Recreated Facebook mobile UI with custom widgets and responsive layouts."),
                      SizedBox(height: 8),
                      Text(
                        "Student Management App (Flutter – Local Storage)",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "• Built CRUD-based student record management using local storage."),
                      SizedBox(height: 16),
                      Text(
                        "EDUCATION",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Bachelor of Computer Applications (BCA)\n"
                        "Sambhram Institute of Technology & Science, Bengaluru — 2024",
                      ),
                      SizedBox(height: 16),
                      Text(
                        "CERTIFICATIONS",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text("• MS Excel Certification"),
                      Text("• MS Word Certification"),
                      Text(
                          "• Microsoft Security, Compliance & Identity Fundamentals"),
                      SizedBox(height: 16),
                      Text(
                        "LANGUAGES",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text("• Malayalam (Native)"),
                      Text("• English (Average)"),
                      Text("• Tamil (Average)"),
                      Text("• Hindi (Basic)"),
                      SizedBox(height: 16),
                      Text(
                        "INTERESTS",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                          "App Development, UI Design, Programming, Continuous Learning"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
