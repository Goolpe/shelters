import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

void showToast({
  @required String label,
  bool error = false,
}){
  BotToast.showAttachedWidget(
    attachedBuilder: (_) => Builder(
      builder: (context) {
        return Container(
          color: error ? Colors.red : Colors.green,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 54),
          height: 35,
          alignment: Alignment.center,
          child: Text(FlutterI18n.translate(context, label), style: const TextStyle(color: Colors.white))
        );
      }
    ),
    duration: const Duration(seconds: 2),
    target: const Offset(520, 520)
  );
}
