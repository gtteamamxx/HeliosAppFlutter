class RepertoireModel {
  RepertoireModel({
    this.id,
    this.imageUrl,
    this.title,
    this.category,
    this.playHours,
    this.label,
    this.labelHex,
  });

  final int id;
  final String imageUrl;
  final String title;
  final String category;
  final List<DateTime> playHours;
  final String label;
  final String labelHex;

  RepertoireModel copyWithPlayHours({List<DateTime> playHours}) {
    return RepertoireModel(
      id: this.id,
      category: this.category,
      imageUrl: this.imageUrl,
      label: this.label,
      labelHex: this.labelHex,
      playHours: playHours,
      title: this.title,
    );
  }
}
