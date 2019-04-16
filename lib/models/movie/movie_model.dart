import 'package:helios_app/models/category/category_model.dart';
import 'package:helios_app/models/country/country_model.dart';
import 'package:helios_app/models/image/image_model.dart';
import 'package:helios_app/models/person/country_model.dart';

class MovieModel {
  MovieModel({
    this.id,
    this.image,
    this.title,
    this.categories,
    this.label,
    this.labelHex,
    this.minYear,
    this.duration,
    this.productionCountries,
    this.productionYear,
    this.videoImage,
    this.releaseDate,
    this.description,
    this.directors,
    this.screenWriters,
    this.actors,
    this.images,
    this.trailerUrl,
  });

  final int id;
  final ImageModel image;
  final String title;
  final List<CategoryModel> categories;
  final String label;
  final String labelHex;
  final int minYear;
  final Duration duration;
  final List<CountryModel> productionCountries;
  final int productionYear;
  final ImageModel videoImage;
  final DateTime releaseDate;
  final String description;
  final List<PersonModel> directors;
  final List<PersonModel> screenWriters;
  final List<PersonModel> actors;
  final List<ImageModel> images;
  final String trailerUrl;
}
