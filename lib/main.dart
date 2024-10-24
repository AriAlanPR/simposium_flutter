import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:simposium/helpers/app_colors.dart';
import 'package:simposium/helpers/constants.dart';
import 'package:simposium/helpers/persistent_data.dart';
import 'package:simposium/views/configuracion.dart';
import 'package:simposium/juego/tec_game.dart';
import 'package:simposium/helpers/mixins/validate_mixin.dart';
import 'package:simposium/views/menu_inicio.dart';
import 'package:simposium/views/puntajes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PersistentData.init();
  puntuaciones = PersistentData.preferences?.getStringList("puntuaciones") ?? puntuaciones;
  sonido = PersistentData.preferences?.getBool("sonido") ?? sonido;
  colorBackground = PersistentData.preferences?.getInt("color") ?? colorBackground;

  print("obteniendo datos de memoria interna");
  print("puntuaciones: $puntuaciones");
  print("sonido: $sonido");
  print("color: $colorBackground");

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
          ),
        ),
      );
  }
  
  Widget _getCurrentPage(String route, {Map<String, dynamic>? arguments}) {
    switch (route) {
      case '/puntajes':
        return ScoreMenuPage();
      case '/configuracion':
        return ConfiguracionPage();
      case '/juego':
        return _juegoWidget();
      case '/':
      default: // Same as '/'
        return const MenuInicioPage();
    }
  }

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: AppColors.seed,
      ),
      onGenerateRoute: (settings) {
        //NOTE: uncomment and use this in case is required to pass arguments dynamically
        final parameters = settings.arguments as Map<String, dynamic>?;

        Widget toPage = _getCurrentPage(settings.name!, arguments: parameters);
        
        return MaterialPageRoute(builder: (context) => toPage);
      },
      home: _getCurrentPage(currentRoute),
    );
  }
}
