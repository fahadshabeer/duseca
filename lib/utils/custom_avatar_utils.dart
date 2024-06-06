import 'dart:math';
import 'package:flutter/material.dart';

// Function to generate a random color
class CustomAvatarUtils {
  static Color generateRandomColor() {
    final random = Random();
    int r, g, b;

    do {
      r = random.nextInt(256);
      g = random.nextInt(256);
      b = random.nextInt(256);
    } while (isColorTooDark(r, g, b) || isColorWhite(r, g, b));

    return Color.fromARGB(255, r, g, b);
  }

// Function to check if the color is too dark
  static bool isColorTooDark(int r, int g, int b) {
    final brightness = (r * 299 + g * 587 + b * 114) / 1000;
    return brightness < 100;
  }

// Function to check if the color is white
  static bool isColorWhite(int r, int g, int b) {
    return r > 240 && g > 240 && b > 240;
  }

// Function to generate a linear gradient with 3 random colors
  static LinearGradient generateRandomLinearGradient() {
    return LinearGradient(
      colors: [
        generateRandomColor(),
        generateRandomColor(),
        generateRandomColor(),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static Widget getAlphAvatar(String name){
    return Container(
      decoration: BoxDecoration(
        gradient:CustomAvatarUtils.generateRandomLinearGradient(),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text("${name.split(" ").first.characters.first}${name.split(" ").last.characters.first}",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
