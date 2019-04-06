import 'package:flutter/material.dart';

class ChangeVisibilityOfBackButtonAction {
  ChangeVisibilityOfBackButtonAction({
    this.isVisible,
    this.backAction,
  });

  final bool isVisible;
  final VoidCallback backAction;
}
