
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simposium/helpers/extensions/nullable_extension.dart';

class Dialogo {
  Dialogo._();

  static void showLoadingDialog(
    BuildContext context, {
    String? message, 
    double spinnerSize = 32,
    VoidCallbackAction? dismiss,
    }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (message.exists) ...[
                Text(message!),
                const SizedBox(width: 10),
              ],
              LoadingAnimationWidget.beat(color: Colors.green.shade800, size: spinnerSize),
            ],
          ),
        );
      },
    );
  }
}
