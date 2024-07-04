import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class CommunicationsCheck {
  static Future<bool> checkIntrnet(context) async {
    if (await InternetConnection().hasInternetAccess) {
      return true;
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text(
              textAlign: TextAlign.center, 'There is no internet connection'),
          icon: Icon(
            Icons.error,
          ),
        ),
      );
      return false;
    }
  }
}
