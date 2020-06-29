import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdhote/gdhote_app.dart';
import 'package:gdhote/pages/signin/signin_page.dart';
import 'package:gdhote/providers/settings/settings_provider.dart';
import 'package:gdhote/services/gdhote_api_service.dart';
import 'package:gdhote/utils/helpers/scaffold_helper.dart';
import 'package:gdhote/utils/helpers/types_helper.dart';
import 'package:gdhote/utils/views/widget_view.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class SettingsPage extends StatefulWidget {
  static const SettingsPageRouteName = '/settings';

  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }

  void showThemeDialog() {
    showDialog<ThemeOptionType>(
      context: context,
      builder: (BuildContext context) {
        ThemeOptionType themeOption =
            context.select<SettingsProvider, ThemeOptionType>(
                (value) => value.themeOption);
        return SimpleDialog(
          title: Text('Theme'),
          children: <Widget>[
            RadioListTile<ThemeOptionType>(
              title: Text('Light'),
              value: ThemeOptionType.LIGHT,
              groupValue: themeOption,
              onChanged: updateTheme,
            ),
            RadioListTile<ThemeOptionType>(
              title: Text('Dark'),
              value: ThemeOptionType.DARK,
              groupValue: themeOption,
              onChanged: updateTheme,
            ),
            RadioListTile<ThemeOptionType>(
              title: Text('System'),
              value: ThemeOptionType.SYSTEM,
              groupValue: themeOption,
              onChanged: updateTheme,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(onPressed: close, child: Text('CLOSE'))
              ],
            )
          ],
        );
      },
    );
  }

  String getThemeTileSubtitle(BuildContext context) {
    ThemeOptionType optionType =
        context.select<SettingsProvider, ThemeOptionType>(
            (value) => value.themeOption);
    return optionType == ThemeOptionType.LIGHT
        ? 'Light'
        : optionType == ThemeOptionType.DARK ? 'Dark' : 'System';
  }

  void updateTheme(ThemeOptionType option) {
    context.read<SettingsProvider>().themeOption = option;
    Navigator.pop(context, option);
  }

  void close() {
    Navigator.pop(context);
  }

  void logOut() async {
    showActivityIndicator();

    Tuple2<bool, String> response = await GdhoteApiService.logOutUser();

    ScaffoldHelper.showSnackBar(
      key: GdhoteApp.globalScaffoldKey,
      message: response.item2,
      isSuccess: response.item1,
    );

    if (response.item1) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInPage.SignInPageRouteName,
        (route) {
          return false;
        },
      );
    } else {
      Navigator.pop(context);
    }
  }

  void showActivityIndicator() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            child: Center(
              child: Container(
                height: 48.0,
                width: 48.0,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WidgetView extends WidgetView<SettingsPage, _Controller> {
  final _Controller state;

  _WidgetView(this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.style),
              title: Text('Theme'),
              subtitle: Text(state.getThemeTileSubtitle(context)),
              onTap: state.showThemeDialog,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log out'),
              onTap: state.logOut,
            ),
          ],
        ),
      ),
    );
  }
}
