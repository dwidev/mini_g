import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

void showFlashBar({
  required BuildContext context,
  required String description,
}) async {
  await showFlash(
    context: context,
    duration: const Duration(seconds: 3),
    builder: (context, controller) {
      return Flash.bar(
        controller: controller,
        position: FlashPosition.top,
        backgroundColor: Colors.black,
        child: DefaultTextStyle(
          style: TextStyle(
              // color: theme.canvasColor,
              ),
          child: FlashBar(
            content: Text(description),
          ),
        ),
      );
    },
  );
}
