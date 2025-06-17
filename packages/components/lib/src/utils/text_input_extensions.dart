import 'package:flutter/material.dart';


/// 🔤 TEXT INPUT ACTION EXTENSION
extension TextInputActionExtension on dynamic {
  TextInputAction get actionNone => TextInputAction.none;
  TextInputAction get unspecified => TextInputAction.unspecified;
  TextInputAction get done => TextInputAction.done;
  TextInputAction get go => TextInputAction.go;
  TextInputAction get search => TextInputAction.search;
  TextInputAction get send => TextInputAction.send;
  TextInputAction get next => TextInputAction.next;
  TextInputAction get previous => TextInputAction.previous;
  TextInputAction get continueAction => TextInputAction.continueAction;
  TextInputAction get join => TextInputAction.join;
  TextInputAction get route => TextInputAction.route;
  TextInputAction get emergencyCall => TextInputAction.emergencyCall;
  TextInputAction get newline => TextInputAction.newline;
}


