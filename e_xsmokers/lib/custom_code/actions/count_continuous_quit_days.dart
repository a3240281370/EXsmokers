// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future countContinuousQuitDays(int? continuousQuitDays) async {
  //  argument add 1 upon the first login of each day. but reset it to zero if a day without logging in
// Assuming that the function is called every time the user logs in

  // Get the current date
  DateTime now = DateTime.now();

  // Get the last login date from shared preferences or database
  DateTime? last_login_time = DateTime.parse(
      '2022-01-01'); // replace with last login date from database

  // If there is no last login date, set the continuous quit days to zero
  // ignore: unnecessary_null_comparison
  if (last_login_time == null) {
    continuousQuitDays = 1;
  } else {
    // Calculate the difference between the last login date and the current date
    Duration difference = now.difference(last_login_time);

    // If the difference is more than one day, reset the continuous quit days to zero
    if (difference.inDays > 1) {
      continuousQuitDays = 0;
    }
  }

  // Add 1 to the continuous quit days
  continuousQuitDays = continuousQuitDays! + 1;

  // Save the current login date to shared preferences or database
  last_login_time = now;

  return continuousQuitDays;
}
