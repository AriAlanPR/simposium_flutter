import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:simposium/views/configuracion.dart';
import 'package:simposium/juego/tec_game.dart';
import 'package:simposium/helpers/mixins/validate_mixin.dart';
import 'package:simposium/views/menu_inicio.dart';
import 'package:simposium/views/puntajes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Hides status bar to give immersion in-game
  Flame.device.fullScreen();
  //locks device to portrait view
  Flame.device.setPortrait();

  runApp(const GameAppWrapper());
}

class GameAppWrapper extends StatefulWidget {
  const GameAppWrapper({super.key});

  @override
  State<GameAppWrapper> createState() => _GameAppWrapperState();
}

class _GameAppWrapperState extends State<GameAppWrapper> with ValidateMixin {
  String currentRoute = '/';

  Widget _juegoWidget() {
    final game = isMobile ? TecGame() : TecGame.web();
    final gameWidget = GameWidget(
      game: game,
    );

    return isMobile
      ? gameWidget
      : Center(
        child: FittedBox(
            child: SizedBox(
          width: defaultWidth,
          height: defaultHeight,
          child: gameWidget,
        )),
      );
  }
  
  Widget getCurrentPage(String route, {Map<String, dynamic>? arguments}) {
    switch (route) {
      case '/scores':
        return ScoreMenuPage();
      case '/configuration':
        return ConfiguracionPage();
      case '/game':
        return _juegoWidget();
      case '/':
      default: // Same as '/'
        return MenuInicioPage();
    }
  }

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      home: Material(
        child: Navigator(
          onGenerateRoute: (settings) {
            //NOTE: uncomment and use this in case is required to pass arguments dynamically
            final args = settings.arguments as Map<String, dynamic>?;
            Widget toPage = getCurrentPage(settings.name!, arguments: args);
            
            return MaterialPageRoute(builder: (context) => toPage);
          },
        ),
      ),
    );
  }
}
