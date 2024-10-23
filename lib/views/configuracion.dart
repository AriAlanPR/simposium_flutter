import 'package:flutter/material.dart';
import 'package:simposium/helpers/mixins/validate_mixin.dart';
import 'package:simposium/helpers/app_colors.dart';
import 'package:simposium/helpers/persistent_data.dart';
import 'package:simposium/helpers/widgets/dialog.dart';
import 'package:simposium/helpers/widgets/easytext.dart';
import 'package:simposium/helpers/widgets/particles.dart';

class ConfiguracionPage extends StatelessWidget with ValidateMixin {
  final String defaultName = "Guest";
  final _nombreController = TextEditingController();

  ConfiguracionPage({
    super.key,  
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Easytext(text: "Configuración", size: 40),
        backgroundColor: Colors.blueGrey.shade800,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: AppColors.navy,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: calculatedHeight(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade800,
                  Colors.grey.shade600.withOpacity(0.7),
                  Colors.blueGrey.shade800.withOpacity(0.7),
                  Colors.blueGrey.shade600.withOpacity(0.7)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Easytext(text: "sonido", size: 20),
                      Switch.adaptive(
                        value: false, 
                        onChanged: (value) {

                        },
                      ),
                      const SizedBox(height: 20),
                      const Easytext(text: "background", size: 20),
                      Wrap(
                        children: [
                          Container(
                            color: Colors.red,
                            width: 50,
                            height: 50,
                          ),
                          Container(
                            color: Colors.blue,
                            width: 50,
                            height: 50,
                          ),
                          Container(
                            color: Colors.green,
                            width: 50,
                            height: 50,
                          ),
                          Container(
                            color: Colors.yellow,
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          Dialogo.showLoadingDialog(context, message: "Guardando");
                          await PersistentData.save("nombre", _nombreController.text);
                          if(context.mounted) {
                            Navigator.of(context).pop();
                            //show confetti
                            Particles(
                              context: context,
                            ).showCircle();
                            //dismiss loading
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade800,
                        ),
                        child: const Easytext(
                          text: "Giuardar",
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}