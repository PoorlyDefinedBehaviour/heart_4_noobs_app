import 'package:flutter/material.dart';
import 'package:heart_4_noobs/core/constants/routes.dart';
import 'package:heart_4_noobs/core/themes/theme.dart';
import 'package:heart_4_noobs/domain/usecases/get_starting_route.dart';
import 'package:heart_4_noobs/locator.dart';
import 'package:heart_4_noobs/presentation/login/login_page_provider.dart';
import 'package:heart_4_noobs/presentation/login/pages/configuration_page.dart';
import 'package:heart_4_noobs/presentation/login/pages/discord_page.dart';
import 'package:heart_4_noobs/presentation/login/pages/information_page.dart';
import 'package:provider/provider.dart';
import 'package:heart_4_noobs/presentation/login/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  final getStartingRoute = locator<GetStartingRoute>();

  final startingRoute = await getStartingRoute();

  final selectedPageIndex = Routes.toList().indexOf(startingRoute);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        Provider(
            create: (_) => LoginPageModel(selectedPageIndex: selectedPageIndex))
      ],
      child: App(startingRoute: startingRoute),
    ),
  );
}

class App extends StatelessWidget {
  final String startingRoute;

  App({@required this.startingRoute});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, _) => MaterialApp(
          title: 'He4rt Repos',
          theme: themeModel.theme,
          initialRoute: startingRoute,
          routes: {
            Routes.welcome: (context) => WelcomePage(),
            Routes.information: (context) => InformationPage(),
            Routes.discord: (context) => DiscordPage(),
            Routes.configuration: (context) => ConfigurationPage()
          }),
    );
  }
}
