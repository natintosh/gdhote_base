import 'package:flutter/material.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class ListUserPage extends StatefulWidget {
  static const ListUserPageRouteName = '/list-user';
  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }
}

class _WidgetView extends WidgetView<ListUserPage, _Controller> {
  final _Controller state;

  _WidgetView(this.state);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
