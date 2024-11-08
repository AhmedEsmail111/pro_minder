import 'package:flutter/material.dart';

class DrawerManager {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  static void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  static void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }
}
