import 'package:flutter/material.dart';
import 'package:helios_app/models/category/category_model.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/ui/common/helios_text.dart';

class MovieCategory extends StatelessWidget {
  MovieCategory({this.categories, this.fontSize});

  final List<CategoryModel> categories;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return HeliosText(
      this.categories.map((x) => x.name).join(", "),
      color: HeliosColors.categoryFontColor,
      fontSize: this.fontSize,
      height: 1.0,
    );
  }
}
