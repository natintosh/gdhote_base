import 'package:flutter/material.dart';

class ThemeWrapper extends StatelessWidget {
  final Color primaryColor;
  final Widget child;

  const ThemeWrapper({
    Key key,
    @required this.primaryColor,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Theme(
            data: ThemeData(
              primaryColor: primaryColor,
            ),
            child: child,
          )
        : child;
  }
}
