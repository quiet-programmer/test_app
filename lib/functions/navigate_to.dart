import 'package:flutter/material.dart';

Future navigateTo(BuildContext context, {required Widget destination}) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => destination));
}

Future navigateReplaceTo(BuildContext context, {required Widget destination}) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => destination));
}

Future navigateEndTo(BuildContext context, {required Widget destination}) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => destination), (route) => false);
}