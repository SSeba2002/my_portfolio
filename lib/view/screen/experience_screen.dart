import 'package:flutter/material.dart';
import 'package:my_portfolio/models/experience_model.dart';

class ExperienceScreen extends StatelessWidget {
  final List<Experience> experiences = const [
    Experience(
      company: 'App Trainers',
      position: 'Mobile Developer Internship',
      duration: '6 Months',
      description: 'Took 6-months course in mobile development (Flutter)',
    ),
    Experience(
      company: 'New Generation Markets',
      position: 'Data Entry',
      duration: '2 Months',
      description: 'Data entry / post creation assistance / sales',
    ),
    Experience(
      company: 'CSC Beyond ',
      position: 'telesales ',
      duration: '2 Months',
      description: 'telesales / customer service',
    ),
    Experience(
        company: 'Security Depository Authority',
        position: 'Programming Trainee',
        duration: '4 Months',
        description: '''I took a 4-month course in the Information Technology Department,\nwhere I completed a project using web languages such as PHP, HTML, and CSS.\nI also completed a full database task and handled quality assurance tasks with proficiency.'''
    ),

  ];

  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return _buildExperienceCard(experiences[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(Experience experience) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.position,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              experience.company,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              experience.duration,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 12),
            Text(experience.description),
          ],
        ),
      ),
    );
  }
}