import 'package:flutter/material.dart';

class MovieHero extends StatelessWidget {
  MovieHero({
    this.child,
    @required this.id,
  });
  final Widget child;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'movieImage$id',
      child: this.child,
    );
  }
}
