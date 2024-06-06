
import 'package:flutter/widgets.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'dart:ui' as ui;
class StaticControllers{

  static final pageController=PageController(initialPage: 2);
 static final GlobalKey<SliderDrawerState> sliderDrawerKey =
  GlobalKey<SliderDrawerState>();
 static ui.Image? image;
}