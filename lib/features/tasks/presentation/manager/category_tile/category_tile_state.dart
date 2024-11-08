import 'package:flutter/material.dart';

@immutable
sealed class CategoryTileStates {}

final class CategoryTileInitial extends CategoryTileStates {}

final class ChangeSelectedCategory extends CategoryTileStates {}
