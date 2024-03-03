import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int likes(UserPostsRecord? post) {
  return post!.likes.length;

  ///  return post!.likes.length;
}

bool hasUploadedMedia(String? mediaPath) {
  return mediaPath != null && mediaPath.isNotEmpty;
}

double? calculateProgressBar(
  int? quitDays,
  int? cigarQuantity,
  int? cigarPrice,
  List<GoalsRecord>? goalsDocuments,
  DocumentReference? userRef,
) {
  // return the sum of expected_to_save only if (goalsDocument's user == userRef)
  if (goalsDocuments == null ||
      quitDays == null ||
      cigarQuantity == null ||
      cigarPrice == null ||
      goalsDocuments == null) {
    return 0;
  }

  double expectedToSave = 0;

  for (var goal in goalsDocuments) {
    if (goal.user == userRef) {
      expectedToSave += goal.expectedToSave ?? 0;
    }
  }

  if (expectedToSave == 0) {
    return 1;
  }

  int hasSaved = quitDays * cigarQuantity * cigarPrice;

  if (hasSaved / expectedToSave >= 1) {
    return 1.0;
  }

  return expectedToSave != 0
      ? ((quitDays * cigarQuantity * cigarPrice) / expectedToSave)
      : null;
}

int? moneySaved(
  int quitDays,
  int cigarQuantity,
  int cigarPrice,
) {
  if (quitDays == null || cigarQuantity == null || cigarPrice == null) {
    return 0;
  }

  int moneyHaveSaved = quitDays * cigarQuantity * cigarPrice;
  return moneyHaveSaved;
}

int? getContinuousQuitDays(int days) {
  // Every time it passes midnight, the parameter 'days' will automatically increase by 1.
  DateTime now = DateTime.now();
  DateTime midnight = DateTime(now.year, now.month, now.day, 0, 0, 0);
  if (now.isAfter(midnight)) {
    days = days + 1;
  }
  return days;
}

bool? isSmoke(bool? issmoke) {
  // Every time it passes midnight, the parameter 'isSmoke' will automatically reset to zero
  DateTime now = DateTime.now();
  DateTime midnight = DateTime(now.year, now.month, now.day, 0, 0, 0);
  if (now.isAfter(midnight)) {
    issmoke = false;
  }
  return issmoke;
}

bool? isTodayQuitButtonAble(
  DateTime? currentTime,
  DateTime? lastPressIsTodayQuitDate,
) {
  // If currentTime's date equal to lastPressIsTodayQuitDate's date, return True. Else return false
  if (currentTime == null || lastPressIsTodayQuitDate == null) {
    return false;
  }
  return currentTime.year == lastPressIsTodayQuitDate.year &&
      currentTime.month == lastPressIsTodayQuitDate.month &&
      currentTime.day == lastPressIsTodayQuitDate.day;
}
