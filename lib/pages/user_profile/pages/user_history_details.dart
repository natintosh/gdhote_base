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
                        style: Theme.of(context).textTheme.subtitle1,
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
              height: MediaQuery.of(context).size.height * 0.02,
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
            ListTile(
              title: Text('Status'),
              subtitle: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    color: Color(0xFF76b73f),
                  ),
                  child: Text(
                    'Completed',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Comment'),
              subtitle: Text(
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.'),
            )
          ],
        ),
      ),
    );
  }
}
