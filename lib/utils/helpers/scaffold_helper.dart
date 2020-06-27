import 'package:flutter/material.dart';

class ScaffoldHelper {
  static void showSnackBar({
    @required GlobalKey<ScaffoldState> key,
    @required String message,
    @required bool isSuccess,
  }) {
    key.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess
            ? Colors.greenAccent.withOpacity(0.75)
            : Colors.pinkAccent.withOpacity(0.75),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'CLOSE',
          onPressed: () {
            key.currentState.hideCurrentSnackBar();
          },
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
