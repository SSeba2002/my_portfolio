import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Container(
          height: 320,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade600,
              ],
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 15),


              Text(
                'Seba Ramzi',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Flutter Developer',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: InkWell(
                      onTap: () => _launchUrl('mailto:sebaramzi5@gmail.com'),
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.email, color: Colors.grey.shade300, size: 20),
                            const SizedBox(width: 8),
                            SelectableText(
                              'sebaramzi5@gmail.com',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  _buildSocialIcon(
                    icon: Icons.link,
                    color: Colors.blue.shade200,
                    onTap: () => _launchUrl('https://drive.google.com/file/d/1YFJEFuUUWjhyUq-3TpNHJQt6f0IhbtE-/view?usp=drivesdk'),
                    tooltip: 'CV',
                  ),
                  _buildSocialIcon(
                    image: 'assets/icons/github.png',
                    onTap: () => _launchUrl('https://github.com/SSeba2002'),
                    tooltip: 'github'
                  ),
                  _buildSocialIcon(
                    image: 'assets/icons/linkedin.png',
                    onTap: () => _launchUrl('https://www.linkedin.com/in/seba-ramzi-536307318?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app'),
                      tooltip: 'linkedin'
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }


  Widget _buildSocialIcon({
    IconData? icon,
    String? image,
    Color? color,
    String? tooltip,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Tooltip(
        message: tooltip ?? '',
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: icon != null
                  ? Icon(icon, size: 20, color: color ?? Colors.white)
                  : Image.asset(
                image!,
                width: 20,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}