import 'package:flutter/material.dart';


class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'About Me',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: 1,
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  height: 1.8,
                ),
                children: const [
                  TextSpan(
                    text: 'A passionate ',
                  ),
                  TextSpan(
                    text: 'Flutter developer ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'dedicated to building high-quality mobile applications with exceptional user experiences.\n\n',
                  ),
                  TextSpan(
                    text:
                    'I have experience developing apps for both Android and iOS using Flutter, and I continuously work on improving my skills while staying up-to-date with the latest ',
                  ),
                  TextSpan(
                    text: 'UI/UX technologies',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: '.\n\n',
                  ),
                  TextSpan(
                    text:
                    'I enjoy problem-solving, teamwork, and turning ideas into practical applications that serve users effectively.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),

          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              _buildSkillChip('Flutter & Dart – Cross-platform app development', Icons.developer_mode),
              _buildSkillChip('Dart', Icons.code),
              _buildSkillChip('Firebase', Icons.cloud),
              _buildSkillChip('UI/UX', Icons.design_services),
              _buildSkillChip('State Management ', Icons.real_estate_agent),
              _buildSkillChip('RESTful APIs – Integration & data handling', Icons.api),
              _buildSkillChip('Google Maps & Geolocation – Live tracking & location services', Icons.map),
              _buildSkillChip('Local Storage – SharedPreferences, SQLite', Icons.storage),
              _buildSkillChip('Design Patterns – Clean architecture, separation of concerns', Icons.pattern),
              _buildSkillChip('Database Management – Cloud & local solutions', Icons.storage),
              _buildSkillChip('Git & GitHub – Version control and collaboration', Icons.qr_code_scanner),





            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String text, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(text),
      backgroundColor: Colors.blue.withOpacity(0.1),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}