class Project {
  final String name;
  final String description;
  final List<String> features;
  final List<String> technologies;
  final String githubUrl;
  final List<String>? screenshots;
  final bool isWeb;

  const Project({
    required this.name,
    required this.description,
    required this.features,
    required this.technologies,
    required this.githubUrl,
    this.screenshots,
    this.isWeb = false,
  });
}