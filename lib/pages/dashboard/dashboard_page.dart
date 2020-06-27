import 'package:flutter/material.dart';
import 'package:gdhote/pages/add_beneficiary/add_beneficiary_page.dart';
import 'package:gdhote/pages/dashboard/widgets/dashboard_card.dart';
import 'package:gdhote/pages/search/search_page.dart';
import 'package:gdhote/pages/settings/settings_page.dart';
import 'package:gdhote/utils/views/widget_view.dart';
import 'package:gdhote/widgets/open_contrainer_wrapper.dart';

class DashboardPage extends StatefulWidget {
  static const DashboardPageRouteName = '/dashboard';

  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }

  void onSearchCardTap() {
    Navigator.pushNamed(context, SearchPage.SearchPageRouteName);
  }

  void openSettings() {
    Navigator.pushNamed(context, SettingsPage.SettingsPageRouteName);
  }
}

class _WidgetView extends WidgetView<DashboardPage, _Controller> {
  final _Controller state;

  _WidgetView(this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: MediaQuery.of(context).viewPadding,
      child: Container(
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Dashboard',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: state.openSettings,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              child: Hero(
                tag: 'hero-tag-search',
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: StadiumBorder(),
                  child: InkWell(
                    onTap: state.onSearchCardTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16.0),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            GridView.count(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: <Widget>[
                OpenContainerWrapper(
                  cardColor: Colors.blue,
                  openContainer: (BuildContext context, callback) {
                    return AddBeneficiaryPage();
                  },
                  closeBuilder: (BuildContext context, callback) {
                    return DashboardCard(
                      assetPath: 'assets/svg/illustration_add.svg',
                      title: 'Add beneficiary',
                      color: Colors.blue,
                      onTap: callback,
                    );
                  },
                ),
//                OpenContainerWrapper(
//                  cardColor: Colors.cyan,
//                  openContainer: (BuildContext context, callback) {
//                    return ListUserPage();
//                  },
//                  closeBuilder: (BuildContext context, callback) {
//                    return DashboardCard(
//                      assetPath: 'assets/svg/illustration_list.svg',
//                      title: 'All beneficiary',
//                      color: Colors.cyan,
//                      onTap: callback,
//                    );
//                  },
//                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
