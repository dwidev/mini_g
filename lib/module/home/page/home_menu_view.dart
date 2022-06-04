import 'package:flutter/material.dart';
import 'package:mini_g/widget/circle_button_widget.dart';
import 'package:mini_g/widget/minig_button_widget.dart';

import '../../../constant/image_assets.dart';
import '../../../functions/money_converters.dart';
import '../../../theme/theme_constant.dart';
import '../model/menu_item_model.dart';

abstract class HomeMenuViewDelegate {
  void onPressedMenu(int index, MenuItemModel item);
}

class HomeMenuView extends StatelessWidget {
  final HomeMenuViewDelegate delegate;
  final List<MenuItemModel> listMenus;

  const HomeMenuView({
    Key? key,
    required this.delegate,
    required this.listMenus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return SizedBox(
      width: size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: listMenus.length,
        itemBuilder: (context, index) {
          final menu = listMenus[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: size.width,
            child: InkWell(
              onTap: () {
                delegate.onPressedMenu(index, menu);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MiniG.sizeM, vertical: MiniG.sizeS),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: MiniG.unselectedColor,
                            borderRadius: MiniG.borderRadius,
                            image: const DecorationImage(
                              image: AssetImage(ayamGeprek),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menu.name,
                                style: textTheme.bodyText1,
                                overflow: TextOverflow.clip,
                                maxLines: 3,
                              ),
                              Text(
                                moneyConverters(menu.price),
                                style: textTheme.headline1?.copyWith(
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.clip,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (menu.amount > 0) ...{
                      Container(
                        padding: const EdgeInsets.all(MiniG.sizeS),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MiniG.greenSecondary.withOpacity(0.5),
                        ),
                        child: Text(menu.amount.toString()),
                      )
                    }
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
