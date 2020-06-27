import 'package:flutter/material.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class UserHistoryDetailsPage extends StatefulWidget {
  static const UserHistoryDetailsPageRouteName = '/user-history-details';

  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<UserHistoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }
}

class _WidgetView extends WidgetView<UserHistoryDetailsPage, _Controller> {
  final _Controller state;

  _WidgetView(this.state) : super(state: state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Monday,',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '25th of March, 2020',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Text(
                  '30 Month ago',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Text('completed'),
                labelStyle: Theme.of(context).accentTextTheme.bodyText1,
                backgroundColor: Color(0xFF00962A),
                labelPadding: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Divider(),
            ListTile(
              title: Text('Quantity'),
              subtitle: Text('5 Litres'),
            ),
            ListTile(
              title: Text('Quantity'),
              subtitle: Text('5 Litres'),
            ),
          ],
        ),
      ),
    );
  }
}
