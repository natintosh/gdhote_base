import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdhote/pages/add_beneficiary/add_beneficiary_page.dart';
import 'package:gdhote/pages/dashboard/dashboard_page.dart';
import 'package:gdhote/pages/fill/fill_page.dart';
import 'package:gdhote/pages/list_users/list_user_page.dart';
import 'package:gdhote/pages/search/search_page.dart';
import 'package:gdhote/pages/settings/settings_page.dart';
import 'package:gdhote/pages/signin/signin_page.dart';
import 'package:gdhote/pages/signup/siginup_page.dart';
import 'package:gdhote/pages/splash/splash_screen_page.dart';
import 'package:gdhote/pages/user_profile/pages/user_history.dart';
import 'package:gdhote/pages/user_profile/pages/user_history_details.dart';
import 'package:gdhote/pages/user_profile/user_profile_page.dart';
import 'package:gdhote/providers/settings/settings_provider.dart';
import 'package:gdhote/utils/helpers/types_helper.dart';
import 'package:gdhote/utils/themes/theme.dart';
import 'package:provider/provider.dart';

class GdhoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness,
        statusBarIconBrightness: GdhoteThemeData.getIconBrightness(
          context,
          context.watch<SettingsProvider>().themeOption,
        ),
      ),
    );

    return FutureBuilder(
      future: context.watch<SettingsProvider>().getUserThemeOption(),
      builder: (BuildContext context, AsyncSnapshot<ThemeOptionType> snapshot) {
        print('rebuild');
        return MaterialApp(
          title: 'GDHOTE App',
          theme: GdhoteThemeData.lightTheme,
          darkTheme: GdhoteThemeData.darkTheme,
          themeMode: GdhoteThemeData.getThemeMode(snapshot),
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreenPage.SplashScreenRouteName,
          onGenerateRoute: onGenerateRoute,
        );
      },
    );
  }

  Route onGenerateRoute(RouteSettings settings) {
    Widget builder = Container();
    bool fullScreenDialog = false;

    switch (settings.name) {
      case SplashScreenPage.SplashScreenRouteName:
        builder = SplashScreenPage();
        break;
      case SignInPage.SignInPageRouteName:
        builder = SignInPage();
        break;
      case SignUpPage.SiginUpPageRouteName:
        builder = SignUpPage();
        break;
      case DashboardPage.DashboardPageRouteName:
        builder = DashboardPage();
        break;
      case SettingsPage.SettingsPageRouteName:
        builder = SettingsPage();
        break;
      case SearchPage.SearchPageRouteName:
        builder = SearchPage();
        break;
      case FillPage.FillPageRouteName:
        builder = FillPage();
        break;
      case UserProfilePage.UserProfilePageRouteName:
        UserProfileArgument args = settings.arguments;
        builder = UserProfilePage(
          heroTag: args.heroTag,
        );
        break;
      case UserHistoryPage.UserHistoryPageRouteName:
        builder = UserHistoryPage();
        break;
      case UserHistoryDetailsPage.UserHistoryDetailsPageRouteName:
        builder = UserHistoryDetailsPage();
        break;
      case AddBeneficiaryPage.AddUserPageRouteName:
        builder = AddBeneficiaryPage();
        break;
      case ListUserPage.ListUserPageRouteName:
        builder = ListUserPage();
        break;
    }

    return MaterialPageRoute(
      builder: (BuildContext context) => builder,
      fullscreenDialog: fullScreenDialog,
      settings: settings,
    );
  }
}
