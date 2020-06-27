import 'package:flutter/material.dart';
import 'package:gdhote/gdhote_app.dart';
import 'package:gdhote/providers/settings/settings_provider.dart';
import 'package:provider/provider.dart';

void main() async {
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
