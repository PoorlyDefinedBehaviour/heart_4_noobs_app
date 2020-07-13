import 'package:flutter/material.dart';
import 'package:heart_4_noobs/core/themes/theme.dart';
import 'package:heart_4_noobs/presentation/widgets/arrow_button.dart';
import 'package:heart_4_noobs/presentation/widgets/rectangle_button.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context).theme;

    return Scaffold(
      body: Container(
        color: theme.primaryColor,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "CONFIGURAÇÃO",
                style: theme.textTheme.headline1.copyWith(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Text("Tema", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                        size: 60,
                      ),
                      SizedBox(width: 30),
                      Icon(
                        Icons.fiber_manual_record,
                        color: Colors.white,
                        size: 60,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.white,
                endIndent: 70,
                indent: 70,
              ),
              Text(
                "Notificação",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              RectangleButton(
                  onPressed: () {},
                  child: Text(
                    "ATIVADO",
                    style: TextStyle(color: Color(0xff00A000)),
                  )),
              Text(
                "Nosso Discord",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              RectangleButton(
                  onPressed: () {},
                  child: Text(
                    "ENTRAR NO DISCORD",
                    style: TextStyle(
                        color: theme.primaryColor, fontWeight: FontWeight.bold),
                  )),
              Text(
                "Repositórios GitHub",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              RectangleButton(
                  onPressed: () {},
                  child: Text(
                    "ENTRAR NO GITHUB",
                    style: TextStyle(
                        color: theme.primaryColor, fontWeight: FontWeight.bold),
                  )),
              Text(
                "Site He4rt Developers",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              RectangleButton(
                  onPressed: () {},
                  child: Text(
                    "SITE HE4RT",
                    style: TextStyle(
                        color: theme.primaryColor, fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 40),
              ArrowButton(
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
