import 'package:flutter/material.dart';
import 'package:my_portfolio/models/project_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';




class ProjectsScreen extends StatelessWidget {
  final List<Project> projects = const [
    Project(
      name: 'FoodTek App',
      description: 'A feature-rich mobile restaurant application developed using Flutter and Cubit for state management.\n'
          ' Built for both iOS and Android, this app delivers a seamless food ordering experience with a strong focus on usability and real-time interaction.',
      features: [
        'User Authentication: Sign up, log in, reset password with Firebase Auth.',
        'Menu & Ordering: Browse detailed food menus and order items directly.',
        'Payment Options: Choose between cash or credit card payments.',
        'Order Tracking: Real-time order tracking with live location updates using Google Maps and Geolocator.',
        'Profile Management: Edit user profile, personal data, and preferences.',
        'Localization: Supports both Arabic and English with full RTL support.',
        'Theme Switching: Toggle between light and dark mode dynamically.',
        'State Management: Built using Cubit (part of Bloc) for organized and scalable code structure.',
        'Modern UI/UX: Responsive, intuitive design with smooth navigation.'
      ],
      technologies: [
        'Flutter',
        'Cubit State Management',
        'Firebase (Auth & Firestore)',
        'Google Maps, Geolocator',
        ' SharedPreferences',
        'Intl and more'
      ],
      githubUrl: ' https://github.com/SSeba2002/foodtek_app.git ',
      screenshots: [
        'assets/images/screenshot1.png',
        'assets/images/screenshot2.png',
        'assets/images/screenshot3.png',
        'assets/images/screenshot4.png',
        'assets/images/screenshot5.png',
        'assets/images/screenshot6.png',
        'assets/images/screenshot7.png',
        'assets/images/screenshot8.png',
        'assets/images/screenshot9.png',
        'assets/images/screenshot10.png',
        'assets/images/screenshot11.png',
        'assets/images/screenshot12.png',
        'assets/images/screenshot13.png',
        'assets/images/screenshot14.png',
        'assets/images/screenshot15.png',
      ],
      isWeb: true,
    ),
  ];
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...projects.map((project) => ProjectCard(project: project)).toList(),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  int _currentImageIndex = 0;

  void _openGallery(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black87.withOpacity(0.9),
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Center(
                    child: PhotoView(
                      imageProvider: AssetImage(
                        widget.project.screenshots![_currentImageIndex],
                      ),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 3,
                    ),
                  ),

                  if (widget.project.screenshots!.length > 1) ...[
                    Positioned(
                      left: 20,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.chevron_left,
                              size: 40,
                              color: Colors.white
                          ),
                          onPressed: _currentImageIndex > 0
                              ? () => setState(() => _currentImageIndex--)
                              : null,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.chevron_right,
                              size: 40,
                              color: Colors.white
                          ),
                          onPressed: _currentImageIndex < widget.project.screenshots!.length - 1
                              ? () => setState(() => _currentImageIndex++)
                              : null,
                        ),
                      ),
                    ),
                  ],

                  Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 30, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  if (widget.project.screenshots!.length > 1)
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.project.screenshots!.length,
                              (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentImageIndex == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation.drive(
              Tween(begin: 0.9, end: 1.0).chain(
                CurveTween(curve: Curves.easeOutBack),
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.project.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),


            Text(
              widget.project.description,
              style: TextStyle(
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),


            if (widget.project.screenshots != null && widget.project.screenshots!.isNotEmpty)
              Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.project.screenshots!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() => _currentImageIndex = index);
                            _openGallery(context);
                          },
                          child: Container(
                            width: 200,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _currentImageIndex == index
                                    ? Colors.blue
                                    : Colors.grey.shade300,
                                width: 2,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                widget.project.screenshots![index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),


            if (widget.project.screenshots != null && widget.project.screenshots!.isNotEmpty)
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.collections, size: 18),
                  label: const Text('Open all images'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => _openGallery(context),
                ),
              ),
            const SizedBox(height: 20),

            _buildSection('Features', widget.project.features, Icons.check_circle),
            _buildSection('Technologies', widget.project.technologies, Icons.code),


            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('View on GitHub'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => launchUrl(Uri.parse(widget.project.githubUrl)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 18, color: Colors.green.shade600),
              const SizedBox(width: 8),
              Expanded(child: Text(item)),
            ],
          ),
        )),
        const SizedBox(height: 15),
      ],
    );
  }
}

