import 'package:bookly/Features/splash/presentation/widgets/slide_text.dart';
import 'package:bookly/core/Function/custom_navigate.dart';
import 'package:bookly/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppAssets.kLogo,
        ),
        const SizedBox(
          height: 4,
        ),
        SlideText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        customPushReplacement(context, path: AppRouter.kHomeView);
        // Get.to(() => const HomeView(),
        //     transition: Transition.leftToRight, duration: kTransitionDuration);
      },
    );
  }
}
