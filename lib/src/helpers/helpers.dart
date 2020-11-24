import 'package:flutter/services.dart' as services;
import 'package:flutter/material.dart';

void cambiarStatusLigth() {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
}

void cambiarStatusDark() {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
}
