import 'package:flutter/material.dart';

import '../../../constant/image_assets.dart';
import '../../../navigator/navigator.dart';
import '../../../theme/theme_constant.dart';
import '../../../widget/minig_button_widget.dart';
import '../../auth/page/sign_page.dart';
import 'on_boarding_view.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int pageIndex = 0;
  late PageController pageController;

  final indicatorContent = [0, 1, 2];

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

  /// function for handle if page changed
  void onPageChange(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
              OnBoardingView(
                image: onboarding1,
                title: "MiniG",
                description:
                    "Kelola tokomu dengan segala kemudahan yang didapat dariku.",
              ),
              OnBoardingView(
                image: onboarding2,
                title: "Aman",
                description:
                    "Keamanan akun dan data - data tokomu menjadi prioritas kami,",
              ),
              OnBoardingView(
                image: onboarding3,
                title: "Mudah",
                description: "Input pengeluaran tokomu dengan kemudahan kami.",
              ),
            ],
            onPageChanged: onPageChange,
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(MiniG.sizeL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ...indicatorContent.map(
                        (index) => Container(
                          margin: const EdgeInsets.only(right: MiniG.sizeSS),
                          width: MiniG.sizeMS,
                          height: MiniG.sizeMS,
                          decoration: BoxDecoration(
                            color: index == pageIndex
                                ? MiniG.greenSecondary
                                : MiniG.greenSecondary.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                  MiniGButtonWidget(
                    onPressed: () {
                      if (pageIndex < 2) {
                        pageController.jumpToPage(pageIndex + 1);
                      } else {
                        push(context: context, page: const SignPage());
                      }
                    },
                    child: Text(pageIndex != 2 ? "lanjut" : "Mulai"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
