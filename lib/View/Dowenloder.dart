import "dart:io";

import "package:before_after/before_after.dart";
import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:gradient_borders/box_borders/gradient_box_border.dart";
import "package:lottie/lottie.dart";
import "package:new_app/Controller/after_before.dart";
import "package:new_app/Controller/replact/Replcate_services.dart";
import "package:new_app/Widget/after_befor_widget.dart";
import "package:new_app/Widget/float_action_button.dart";
import "package:new_app/main.dart";
import "package:simple_gradient_text/simple_gradient_text.dart";

class DownloadPage extends StatelessWidget {
  final AfterBeforeController controller = Get.put(AfterBeforeController());

  DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController prompeController = TextEditingController();
    final TextEditingController NegativeprompeController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Upscale app",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.background,
                      child: Obx(
                        () => controller.isLoading
                            ? Animate(effects: const [
                                FadeEffect(
                                    duration: Duration(milliseconds: 500)),
                                SlideEffect()
                              ], child: MyBeforeAfter(controller: controller))
                            : Animate(
                                effects: const [FadeEffect(), SlideEffect()],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'The data is being processed, please wait',
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    Get.isDarkMode
                                        ? Lottie.asset(
                                            'asset/animated/icon_dark.json')
                                        : Lottie.asset(
                                            "asset/animated/icon_white.json"),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        //print('0==============================');
                        String URL = Myapp.fireBaseServices.imageURL;
                        //print("URL imga : $URL");
                        //await ReplacteServices.Upscaleimage(URL, "", "");
                        await ReplacteServices.sendData(
                            URL, "taha", 'taha neg');

                        controller.changeIsLoading();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(15),
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context).colorScheme.background,
                                  Theme.of(context).colorScheme.background,
                                  Theme.of(context).colorScheme.primary,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                            width: 2,
                          ),
                        ),
                        child: GradientText("Downolad",
                            style: Theme.of(context).textTheme.headline1,
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.primary
                            ]),
                      ),
                    ),
                  ))
            ],
          )),
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

class MyBeforeAfter extends StatelessWidget {
  AfterBeforeController controller;
  MyBeforeAfter({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BeforeAfter(
        value: controller.value,
        trackColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        thumbColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        before: BeforAfeterIteme(
          child: Image.file(File(Myapp.imagecontroller.image)),
          label: "BEFORE",
          alignment: Alignment.topRight,
        ),
        after: BeforAfeterIteme(
          child: Image.asset('asset/after.png'),
          label: "AFTER",
          alignment: Alignment.topLeft,
        ),
        onValueChanged: (value) {
          controller.Changevalue(value);
        },
      );
    });
  }
}
