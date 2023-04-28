import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Future push({required  BuildContext context, required Widget screen,})async{
  return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: screen));
}

Future pushReplacement({required  BuildContext context, required Widget screen,})async{
  return Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: screen));
}

