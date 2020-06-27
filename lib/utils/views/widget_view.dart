import 'package:flutter/material.dart';

abstract class WidgetView<S extends StatefulWidget, T extends State<S>>
    extends StatelessWidget {
  final T state;

  S get widget => state.widget;

  const WidgetView({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context);
}
