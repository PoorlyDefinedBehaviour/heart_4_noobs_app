import 'package:flutter/material.dart';
import 'package:heart_4_noobs/core/constants/routes.dart';
import 'package:heart_4_noobs/core/themes/theme.dart';
import 'package:heart_4_noobs/locator.dart';
import 'package:provider/provider.dart';
import 'package:heart_4_noobs/presentation/login/pages/welcome_page.dart';

void main() async {
  await setupLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, _) => MaterialApp(
        title: 'He4rt Repos',
        theme: themeModel.theme,
        initialRoute: Routes.welcome,
        routes: {
          Routes.welcome: (context) => WelcomePage(),
          Routes.information: (context) => Text("information page"),
          Routes.discord: (context) => Text("discord page"),
          Routes.configuration: (context) => Text("configuration page"),
        },
      ),
    );
  }
}
