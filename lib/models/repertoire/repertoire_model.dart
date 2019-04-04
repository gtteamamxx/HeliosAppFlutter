class RepertoireModel {
  RepertoireModel({
    this.id,
    this.imageUrl,
    this.title,
    this.category,
    this.playHours,
    this.label,
    this.labelHex,
    this.minYear,
    this.duration,
    this.productionCountries,
    this.productionYear,
    this.videoImageUrl,
    this.releaseDate,
    this.description,
    this.directors,
    this.screenWriters,
    this.actors,
    this.galleryUrls,
  });

  final int id;
  final String imageUrl;
  final String title;
  final String category;
  final List<DateTime> playHours;
  final String label;
  final String labelHex;
  final int minYear;
  final Duration duration;
  final List<String> productionCountries;
  final int productionYear;
  final String videoImageUrl;
  final DateTime releaseDate;
  final String description;
  final List<String> directors;
  final List<String> screenWriters;
  final List<String> actors;
  final List<String> galleryUrls;

  RepertoireModel copyWithPlayHours({List<DateTime> playHours}) {
    return RepertoireModel(
      id: this.id,
      category: this.category,
      imageUrl: this.imageUrl,
      label: this.label,
      labelHex: this.labelHex,
      playHours: playHours,
      title: this.title,
      duration: this.duration,
      minYear: this.minYear,
      productionCountries: this.productionCountries,
      productionYear: this.productionYear,
      videoImageUrl: this.videoImageUrl,
      releaseDate: this.releaseDate,
      actors: this.actors,
      description: this.description,
      directors: this.directors,
      galleryUrls: this.galleryUrls,
      screenWriters: this.screenWriters,
    );
  }
}
