import 'package:flutter/material.dart';
import 'package:gdhote/pages/fill/fill_page.dart';
import 'package:gdhote/pages/user_profile/pages/user_history.dart';
import 'package:gdhote/pages/user_profile/pages/user_history_details.dart';
import 'package:gdhote/pages/user_profile/widgets/user_recent_history_card.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class UserProfilePage extends StatefulWidget {
  final String heroTag;

  static const UserProfilePageRouteName = '/user-profile';

  const UserProfilePage({Key key, this.heroTag}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }

  void onFillButtonPressed() {
    Navigator.pushNamed(context, FillPage.FillPageRouteName);
  }

  void seeAllOnPressed() {
    Navigator.pushNamed(context, UserHistoryPage.UserHistoryPageRouteName);
  }

  void historyItemCardTap() {
    Navigator.pushNamed(
        context, UserHistoryDetailsPage.UserHistoryDetailsPageRouteName);
  }
}

class _WidgetView extends WidgetView<UserProfilePage, _Controller> {
  final _Controller state;

  _WidgetView(this.state) : super(state: state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.shortestSide * 0.25,
                  backgroundColor: const Color(0xFFFEC4D2),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: RaisedButton(
                onPressed: state.onFillButtonPressed,
                child: Text('FILL'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Recent history'),
                  FlatButton(
                    onPressed: state.seeAllOnPressed,
                    child: Text('See all'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  UserRecentHistoryCard(
                    status: 'new',
                    filledBy: 'Adeoluwa Ogunye',
                    updatedOn: '2020-06-08 11:29:00',
                    onTap: state.historyItemCardTap,
                  ),
                  UserRecentHistoryCard(
                    status: 'completed',
                    filledBy: 'Adeoluwa Ogunye',
                    updatedOn: '2020-06-05 08:59:56',
                    onTap: state.historyItemCardTap,
                  ),
                  UserRecentHistoryCard(
                    status: 'completed',
                    filledBy: 'Adeoluwa Ogunye',
                    updatedOn: '2020-06-05 08:59:56',
                    onTap: state.historyItemCardTap,
                  ),
                  UserRecentHistoryCard(
                    status: 'completed',
                    filledBy: 'Adeoluwa Ogunye',
                    updatedOn: '2020-06-05 08:59:56',
                    onTap: state.historyItemCardTap,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserProfileArgument {
  final String heroTag;

  UserProfileArgument({this.heroTag});
}
