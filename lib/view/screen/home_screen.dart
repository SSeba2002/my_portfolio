import 'package:flutter/material.dart';
import 'package:my_portfolio/view/widgets/about_me.dart';
import 'package:my_portfolio/view/widgets/header.dart';
import 'package:my_portfolio/view/widgets/fade_in_widget.dart';
import 'package:my_portfolio/view/screen/projects_screen.dart';
import 'package:my_portfolio/view/screen/education_screen.dart';
import 'package:my_portfolio/view/screen/experience_screen.dart';
import 'package:my_portfolio/view/widgets/about_me.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: const HeaderWidget(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const FadeInWidget(child: AboutMeSection()),
              const FadeInWidget(child: ProjectsScreen()),
              const FadeInWidget(child: ExperienceScreen()),
              const FadeInWidget(child: EducationScreen()),
            ]),
          ),
        ],
      ),
    );
  }
}