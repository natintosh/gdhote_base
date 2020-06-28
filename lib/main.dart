import 'package:flutter/material.dart';
import 'package:gdhote/gdhote_app.dart';
import 'package:gdhote/models/user_account/user_account_model.dart';
import 'package:gdhote/models/user_group/user_group.dart';
import 'package:gdhote/providers/settings/settings_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  Hive.initFlutter();
  Hive.registerAdapter(UserAccountModelAdapter());
  Hive.registerAdapter(UserGroupModelAdapter());
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return SettingsProvider();
          },
        ),
      ],
      child: GdhoteApp(),
    ),
  );
}
