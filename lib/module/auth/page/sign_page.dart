import 'package:flutter/material.dart';

import '../../../constant/image_assets.dart';
import '../../../navigator/navigator.dart';
import '../../../theme/theme_constant.dart';
import '../../../widget/minig_button_widget.dart';
import '../../home/page/home_page.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(MiniG.sizeML),
          color: MiniG.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(signPage),
              const SizedBox(height: MiniG.sizeXXL),
              SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "MiniG",
                      style: textTheme.headline1,
                    ),
                    const SizedBox(height: MiniG.sizeSS),
                    Text(
                      "Mulai kelola bisnis anda bersama kami.",
                      style: textTheme.bodyText1,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: MiniG.sizeXXL),
              Container(
                decoration: const BoxDecoration(boxShadow: [MiniG.boxShadow]),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    hintText: "Masukan nomor handphone...",
                  ),
                ),
              ),
              const SizedBox(height: MiniG.sizeXL),
              MiniGButtonWidget(
                onPressed: () {
                  pushAndRemoveAll(context: context, page: const HomePage());
                },
                child: const Text("Masuk"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
