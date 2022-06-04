import 'package:flutter/material.dart';
import 'package:mini_g/utils/minig_flashbar.dart';

import '../../../theme/theme_constant.dart';
import '../model/home_menu_model.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({
    Key? key,
    required this.size,
    required this.listMenuItem,
  }) : super(key: key);

  final Size size;
  final List<HomeMenuModel> listMenuItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(MiniG.sizeS),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...listMenuItem.map(
              (e) => InkWell(
                onTap: () {
                  showFlashBar(
                    context: context,
                    description: "Sabar ya teman, akan segera hadir",
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Image.asset(
                        e.icon,
                        width: 30,
                      ),
                      Text(e.title),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
