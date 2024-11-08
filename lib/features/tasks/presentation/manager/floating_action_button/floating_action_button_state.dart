import 'package:flutter/material.dart';

@immutable
sealed class FloatingActionButtonStates {}

final class FloatingActionButtonInitial extends FloatingActionButtonStates {}

final class HideButtonVisibility extends FloatingActionButtonStates {}

final class ShowButtonVisibility extends FloatingActionButtonStates {}
