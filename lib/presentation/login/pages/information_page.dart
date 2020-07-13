import 'package:flutter/material.dart';
import 'package:heart_4_noobs/core/themes/theme.dart';
import 'package:heart_4_noobs/presentation/login/login_page_provider.dart';
import 'package:heart_4_noobs/presentation/login/widgets/page_dots.dart';
import 'package:heart_4_noobs/presentation/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class InformationPage extends StatelessWidget {
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
                "assets/images/hero_1.png",
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '''Todos os repositórios são gratuitos
para você estudar, caso queira
constribuir acesse nossa comunidade''',
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
