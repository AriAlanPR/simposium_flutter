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
                      const Easytext(text: "nombre", size: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.green.shade900.withOpacity(0.2),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                          onTapOutside: (_) {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          Dialogo.showLoadingDialog(context, message: "Guardando");
                          await PersistentData.save("nombre", _nombreController.text);
                          if(context.mounted) {
                            //show confetti
                            Particles(
                              context: context,
                            ).showCircle();
                            //dismiss loading
                            Navigator.of(context).pop();
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