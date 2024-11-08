class BoardingPageEntity {
  final String title;
  final String description;
  final String? secondLineDescription;
  final String imageAsset;

  BoardingPageEntity({
    required this.title,
    required this.description,
    this.secondLineDescription,
    required this.imageAsset,
  });
}
