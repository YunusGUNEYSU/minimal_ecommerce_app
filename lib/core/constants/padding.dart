import 'package:flutter/material.dart';

@immutable
final class AppPadding extends EdgeInsets {
  final double? value;

  /// default 12 padding all
  const AppPadding.normalAll({this.value}) : super.all(value??12);

  /// 24 padding all
  const AppPadding.heightAll({this.value}) : super.all(value??24);

  /// 24 only bottom
  const AppPadding.onlyBottom({this.value}) : super.only(bottom: 24);
  const AppPadding.onlyLeft({this.value}) : super.only(left: value??16);
  const AppPadding.normalHorizontal({this.value}) : super.symmetric(horizontal: 12);
}
