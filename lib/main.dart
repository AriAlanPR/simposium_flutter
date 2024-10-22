import 'package:flutter/material.dart';

void main() {
  final key = GlobalKey();
  final inicio = Inicio(key: key);
  runApp(inicio);
}

class Inicio extends StatefulWidget {
  const Inicio({
    super.key,
  });

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  //NOTE - esto es un metodo sobreescrito
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                const Text(
                  'Simposium',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Jugar',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.sports_score_sharp,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35 ,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.settings,
                        size: 60,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}