import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/helper.dart';
import 'package:quran_app/constants/image_constant.dart';
import 'package:quran_app/constants/space_constant.dart';
import 'package:quran_app/controllers/introduction_controller.dart';
import 'package:quran_app/widgets/common_elevated_button.dart';
import 'package:quran_app/widgets/main_body_padding.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  IntroductionController introductionController =
      Get.find<IntroductionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBodyPadding(
        top: 0,
        child: Column(
          children: [
            /* Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                child: Text("Skip"),
              ),
            ), */
            Expanded(
              child: PageView.builder(
                itemCount: introductionController.introList.length,
                controller: introductionController.pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  introductionController.onPageChanged(index);
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        child: Image.asset(
                          ImageConstant.introDesignImage,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Image.asset(
                                  introductionController
                                      .introList[index].imagePath2,
                                  height:
                                      const Helper().getDeviceheight(context) *
                                          0.15, // 10% of screen height
                                  width:
                                      const Helper().getDevicewidth(context) *
                                          0.18, // 20% of screen width
                                ),
                              ),
                            ),
                            Image.asset(
                              introductionController
                                  .introList[index].imagePath1,
                              height: const Helper().getDeviceheight(context) *
                                  0.180, // 12.5% of screen height
                              width: const Helper().getDevicewidth(context) *
                                  0.35, // 25% of screen width
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          height40,
                          Text(
                            introductionController.introList[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          height10,
                          Text(
                            introductionController.introList[index].description,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          height20,
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            GetBuilder<IntroductionController>(builder: (_) {
              return Column(
                children: [
                  DotsIndicator(
                    dotsCount: introductionController.introList.length,
                    position: introductionController.currentIndex.toInt(),
                    decorator: DotsDecorator(
                        activeColor: Get.theme.primaryColor,
                        color: const Color.fromARGB(255, 158, 158, 158)),
                  ),
                  height20,
                  CommonElevatedButton(
                    onPressed: () => introductionController.onDone(),
                    buttonText: introductionController.currentIndex == 2
                        ? "Done"
                        : "Next",
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
