import 'dart:io';
import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:gradient_borders/box_borders/gradient_box_border.dart";
import "package:new_app/Controller/firebase/Firebase_services.dart";
import "package:new_app/Widget/float_action_button.dart";
import "package:new_app/class/message_class.dart";
import "package:new_app/main.dart";
import "package:permission_handler/permission_handler.dart";
import "package:simple_gradient_text/simple_gradient_text.dart";

class Homepage extends StatelessWidget {
  Homepage({super.key});

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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  try {
                    await Permission.manageExternalStorage.request();
                    await Myapp.imagecontroller
                        .PickImageFromGalleryPhone(Myapp.imagecontroller);
                  } catch (e) {}
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 400,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(15),
                    border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.background,
                        Theme.of(context).colorScheme.background,
                        Theme.of(context).colorScheme.primary,
                      ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                      width: 2,
                    ),
                  ),
                  child: GradientText(
                    "Choise Picture",
                    style: Theme.of(context).textTheme.headline2,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Theme.of(context).colorScheme.background,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child:
                      Obx(() => Myapp.imagecontroller.image == "asset/vide.png"
                          ? Image.asset(
                              Myapp.imagecontroller.image,
                              fit: BoxFit.contain,
                            )
                          : Image.file(
                              File(Myapp.imagecontroller.image),
                              fit: BoxFit.contain,
                            )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextFormField(
                  label: "Promp", prompeController: prompeController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextFormField(
                  label: "Negative promp",
                  prompeController: NegativeprompeController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  if (Myapp.imagecontroller.image == "asset/vide.png") {
                    MyMessage.RemarqueMessage(context, "PLEASE TAKE IMAGE");
                  } else {
                    Myapp.fireBaseServices.changeIsLoading(true);
                    await FirebaseService.uploadFile(
                        Myapp.imagecontroller.name,
                        File(Myapp.imagecontroller.image),
                        Myapp.fireBaseServices);
                    print("Image Url : " + Myapp.fireBaseServices.imageURL);
                    Myapp.fireBaseServices.changeIsLoading(false);
                    Get.toNamed("/download");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Obx(() => Myapp.fireBaseServices.isLoading
                      ? Animate(
                          effects: const [FadeEffect(), SlideEffect()],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.background,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "PLEASE WAIT",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        )
                      : GradientText("UPSCAL",
                          style: Theme.of(context).textTheme.headline1,
                          colors: [
                              Theme.of(context).colorScheme.background,
                              Theme.of(context).colorScheme.background
                            ])),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.label,
    required this.prompeController,
  });

  final TextEditingController prompeController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: prompeController,
      decoration: InputDecoration(
        labelText: label,
        errorStyle: const TextStyle(color: Colors.red),
        suffixIconColor: Theme.of(context).colorScheme.primary,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 3, color: Theme.of(context).colorScheme.primary)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
