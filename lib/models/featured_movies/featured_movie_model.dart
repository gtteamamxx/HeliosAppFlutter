class FeaturedMovieModel {
  FeaturedMovieModel({
    this.id,
    this.title,
    this.imageUrl,
    this.trailerUrl,
    this.category,
    this.repertoireId,
  });

  final int id;
  final String title;
  final String imageUrl;
  final String trailerUrl;
  final String category;
  final int repertoireId;
}
