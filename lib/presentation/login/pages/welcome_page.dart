import 'package:flutter/material.dart';
import 'package:heart_4_noobs/core/themes/theme.dart';
import 'package:heart_4_noobs/presentation/login/login_page_provider.dart';
import 'package:heart_4_noobs/presentation/login/widgets/page_dots.dart';
import 'package:provider/provider.dart';
import '../../widgets/rounded_button.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context).theme;

    return Scaffold(
      body: Container(
        color: theme.primaryColor,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/images/logo_white_1.png",
              ),
              Text("Bem-vindo!", style: theme.textTheme.headline1),
              SizedBox(
                height: 40,
              ),
              Text(
                '''Nesse aplicativo você tem acesso a
todos repositórios dos membros da He4rt Developers''',
                style: theme.textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              PageDots(
                  selectedPageIndex:
                      Provider.of<LoginPageModel>(context, listen: false)
                          .selectedPageIndex),
              SizedBox(height: 10),
              RoundedButton(
                onPressed: () =>
                    Provider.of<LoginPageModel>(context, listen: false)
                        .nextPressed(context),
                child: Text(
                  "PRÓXIMO",
                  style: TextStyle(
                      color: theme.primaryColor, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
