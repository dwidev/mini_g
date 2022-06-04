import 'package:flutter/material.dart';

import 'module/onboarding/page/on_boarding_page.dart';
import 'theme/theme_data.dart';

class MiniGApp extends StatelessWidget {
  const MiniGApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini G',
      theme: baseTheme,
      home: const OnBoardingPage(),
      builder: (context, child) {
        return child ?? const Offstage();
      },
    );
  }
}
