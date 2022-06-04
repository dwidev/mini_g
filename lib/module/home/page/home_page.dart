import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mini_g/utils/minig_flashbar.dart';

import '../../../constant/icons_assets.dart';
import '../../../constant/image_assets.dart';
import '../../../navigator/navigator.dart';
import '../../../theme/theme_constant.dart';
import '../../transaction/page/detail_transaction_page.dart';
import '../model/home_menu_model.dart';
import '../model/menu_item_model.dart';
import '../widget/home_floating_button.dart';
import '../widget/home_header_widget.dart';
import '../widget/home_menu_widget.dart';
import 'home_manual_view.dart';
import 'home_menu_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    implements HomeMenuViewDelegate, HomeManualViewDelegate {
  late PageController pageController;

  final listMenuItem = [
    HomeMenuModel(title: "Barcode", icon: qrCode),
    HomeMenuModel(title: "Keuangan", icon: money),
    HomeMenuModel(title: "Laporan", icon: report),
  ];

  final listMenus = [
    MenuItemModel(
      id: "ayam-geprek-97462",
      image: ayamGeprek,
      name: "Ayam Geprek",
      price: 13000,
    ),
    MenuItemModel(
      id: "ayam-geprek-08237",
      image: ayamGeprek,
      name: "Ayam Geprek Gila",
      price: 14000,
    ),
    MenuItemModel(
      id: "ayam-geprek-12432",
      image: ayamGeprek,
      name: "Ayam Geprek Tiramisu",
      price: 20000,
    ),
    MenuItemModel(
      id: "ayam-geprek-87664",
      image: ayamGeprek,
      name: "Ayam Geprek Matcha",
      price: 15000,
    ),
  ];

  final listTransaction = <MenuItemModel>[];

  final homeSectionIndex = [0, 1];
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  void onPressedMenu(int index, MenuItemModel item) {
    setState(() {
      final transaction = listTransaction.firstWhereOrNull(
        (e) => e.id == item.id,
      );

      if (transaction == null) {
        listTransaction.add(item.copyWith(amount: 1));
      } else {
        final index = listTransaction.indexOf(transaction);
        listTransaction[index] = transaction.copyWith(
          amount: transaction.amount + 1,
        );
      }

      changeAmountMenu(index, item);
    });
  }

  @override
  void onAddItem(MenuItemModel item) {
    setState(() {
      listTransaction.add(item);
    });
  }

  void changeAmountMenu(int index, MenuItemModel item) {
    listMenus[index] = listMenus[index].copyWith(
      amount: item.amount + 1,
    );
  }

  void onResetTransaction() {
    setState(() {
      listTransaction.clear();
      for (var index = 0; index < listMenus.length; index++) {
        listMenus[index] = listMenus[index].copyWith(
          amount: 0,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);
    final viewPadding = getViewPadding(context);

    final appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {
            showFlashBar(
              context: context,
              description: "Sabar ya teman, akan segera hadir",
            );
          },
          icon: const Icon(
            Icons.notifications,
          ),
        )
      ],
    );

    final topPadding = viewPadding.top + appBar.preferredSize.height;

    return Scaffold(
      backgroundColor: MiniG.white,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height / 2.5,
            color: Colors.white,
            child: Stack(
              children: [
                HomeHeaderWidget(
                  topPadding: topPadding,
                  saldo: 2000000,
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: HomeMenuWidget(
                    size: size,
                    listMenuItem: listMenuItem,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: MiniG.sizeM,
                  ),
                  child: Row(
                    children: [
                      ...homeSectionIndex.map(
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: TextButton(
                            onPressed: () {
                              pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOutQuint,
                              );
                            },
                            child: Text(
                              index == 0 ? "Menu" : "Manual",
                              style: textTheme.headline1?.copyWith(
                                color: pageIndex == index
                                    ? MiniG.blackPrimary
                                    : MiniG.unselectedColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: MiniG.sizeM),
                Expanded(
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            pageIndex = index;
                          });
                        },
                        children: [
                          HomeMenuView(
                            listMenus: listMenus,
                            delegate: this,
                          ),
                          HomeManualView(delegate: this),
                        ],
                      ),
                      HomeFloatingButton(
                        listTransaction: listTransaction,
                        onPressed: () {
                          if (listTransaction.getTotalItems == 0) {
                            showFlashBar(
                              context: context,
                              description:
                                  "Haiii, pilih atau tambahkan manual minimal 1 item ya",
                            );
                            return;
                          }

                          push(
                            context: context,
                            page: DetailTransactionPage(
                              listTransaction: listTransaction,
                              onResetTransaction: onResetTransaction,
                            ),
                          );
                        },
                        onResetTransaction: onResetTransaction,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
