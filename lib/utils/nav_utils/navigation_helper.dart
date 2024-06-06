
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavHelper
{
  static to(BuildContext context, Widget destination){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>destination));
  }

  static off(BuildContext context, Widget destination){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>destination));
  }
}