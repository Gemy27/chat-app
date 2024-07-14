import 'package:flutter/material.dart';

void createsnackbar(BuildContext context, String st) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(st),
      duration: Duration(seconds: 2),
    ));
  }