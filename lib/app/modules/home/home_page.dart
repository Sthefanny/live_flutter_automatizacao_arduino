import 'package:flutter/material.dart';
import 'package:flutter_arduino/app/shared/configs/themes_config.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          height: _size.height,
          decoration: BoxDecoration(
            gradient: ThemesConfig.gradientBackground,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: _size.height * .2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildIcon(),
                    buildText(),
                  ],
                ),
              ),
              buildCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: FaIcon(
        FontAwesomeIcons.lightbulb,
        color: ThemesConfig.lightBlue,
        size: 40,
      ),
    );
  }

  Widget buildText() {
    return Text(
      'Vermelho',
      style: GoogleFonts.roboto(
        color: ThemesConfig.lightBlue,
        fontSize: 40,
      ),
    );
  }

  Widget buildCard() {
    return InkWell(
      child: Container(
        width: _size.width * 0.7,
        height: _size.height * 0.2,
        decoration: BoxDecoration(
          color: ThemesConfig.cardBg,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.35),
              offset: Offset(0, 4),
              blurRadius: 4,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FaIcon(
                  FontAwesomeIcons.solidLightbulb,
                  color: controller.redIsOn ? ThemesConfig.lightOn : ThemesConfig.lightOff,
                  size: 60,
                ),
              );
            }),
            Observer(builder: (_) {
              return Text(
                controller.redIsOn ? 'Desligar' : 'Ligar',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  color: ThemesConfig.lightBlue,
                ),
              );
            }),
          ],
        ),
      ),
      onTap: controller.toggleRedLight,
    );
  }
}
