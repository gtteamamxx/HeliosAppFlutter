import 'package:flutter/material.dart';

class MovieHeaderHero extends StatelessWidget {
  MovieHeaderHero({
    this.child,
    @required this.id,
  });
  final Widget child;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'movieHeaderImage$id',
      child: this.child,
    );
  }
}
