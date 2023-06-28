import 'package:oic_next_to_you/common/domain/entities/user/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'dart:math';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Extension {
// GET REGISTER STATUS
  String ToThaiDateTime(String data) {
    if (data != "") {
      var buffer1 = data.split('T');
      var buffer2 = buffer1[0].split('-');
      var result = buffer2[2] +
          '/' +
          buffer2[1] +
          '/' +
          (int.parse(buffer2[0]) + 543).toString() +
          ' ' +
          buffer1[1];
      return result;
    } else {
      return "";
    }
  }

  String ToThaiDate(String data) {
    if (data != "") {
      var buffer1 = data.split('T');
      var buffer2 = buffer1[0].split('-');
      var result = buffer2[2] +
          '/' +
          buffer2[1] +
          '/' +
          (int.parse(buffer2[0]) + 543).toString();
      return result;
    } else {
      return "";
    }
  }

  String WordWarp(String word, int endPosition) {
    if (word != "" && word.length > endPosition) {
      var result = word.substring(0, endPosition) + "...";
      return result;
    } else {
      return word;
    }
  }

  String getRandomString(int length) {
    var _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    var result = String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    return result;
  }

  String getRandomNumber(int length) {
    var _chars = '1234567890';
    Random _rnd = Random();
    var result = String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    return result;
  }

  final _positives = ["1", "2", "3", "4", "5", "6", "13", "15"];
  final _negatives = ["7", "8", "9", "10", "11", "12", "14", "16", "17"];

  Color colorFromProcessedText(String group, double percent) {
    if (group != null) {
      // if (_negatives.contains(group)) {
      //   if (percent < 0.25) {
      //     return AppColor.red25;
      //   } else if (percent < 0.5) {
      //     return AppColor.red50;
      //   } else if (percent < 0.75) {
      //     return AppColor.red75;
      //   } else {
      //     return AppColor.red;
      //   }
      // } else if (_positives.contains(group)) {
      //   if (percent < 0.25) {
      //     return AppColor.limeGreen25;
      //   } else if (percent < 0.5) {
      //     return AppColor.limeGreen50;
      //   } else if (percent < 0.75) {
      //     return AppColor.limeGreen75;
      //   } else {
      //     return AppColor.limeGreen;
      //   }
      // }

      if (_negatives.contains(group)) {
        if (percent > 0.50 && percent <= 0.75) {
          return AppColor.red75;
        } else if (percent > 0.75) {
          return AppColor.red;
        }
      } else if (_positives.contains(group)) {
        if (percent > 0.5 && percent <= 0.75) {
          return AppColor.limeGreen50;
        } else if (percent > 0.75) {
          return AppColor.limeGreen75;
        }
      }

      return AppColor.black;
    } else {
      return AppColor.black;
    }
  }
}
