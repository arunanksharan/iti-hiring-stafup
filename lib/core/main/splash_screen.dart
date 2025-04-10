import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:stafup/utils/fh_colors.dart';
import 'package:stafup/utils/fh_global_function.dart';

class SplashScreen extends StatefulWidget {
  final String tag = "/SplashScreen";

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 3));
    defaultBlurRadius = 10.0;
    defaultSpreadRadius = 0.5;
    GlobalFunction.disabledWalkThrough(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HrmColors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: Get.height * 2,
          width: Get.width * 2,
          errorBuilder:
              (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported, size: 100),
        ),
      ),
    );
  }
}
