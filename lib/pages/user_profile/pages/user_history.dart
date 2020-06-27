import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdhote/pages/user_profile/pages/user_history_details.dart';
import 'package:gdhote/pages/user_profile/widgets/user_history_list_item.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class UserHistoryPage extends StatefulWidget {
  static const UserHistoryPageRouteName = '/user-history';

  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<UserHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }

  void historyItemTap() {
    Navigator.pushNamed(
        context, UserHistoryDetailsPage.UserHistoryDetailsPageRouteName);
  }
}

class _WidgetView extends WidgetView<UserHistoryPage, _Controller> {
  final _Controller state;

  _WidgetView(this.state) : super(state: state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            UserHistoryListItem(
              status: 'new',
              onTap: state.historyItemTap,
            ),
            UserHistoryListItem(
              status: 'completed',
              onTap: state.historyItemTap,
            ),
            UserHistoryListItem(
              status: 'completed',
              onTap: state.historyItemTap,
            ),
            UserHistoryListItem(
              status: 'completed',
              onTap: state.historyItemTap,
            ),
            UserHistoryListItem(
              status: 'completed',
              onTap: state.historyItemTap,
            ),
            UserHistoryListItem(
              status: 'completed',
              onTap: state.historyItemTap,
            ),
            UserHistoryListItem(
              status: 'completed',
              onTap: state.historyItemTap,
            ),
          ],
        ),
      ),
    );
  }
}
