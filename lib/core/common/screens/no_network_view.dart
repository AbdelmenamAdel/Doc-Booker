import 'package:flutter/material.dart';
import 'package:markaz_elamal/core/styles/images/app_images.dart';

class NoNetworkView extends StatelessWidget {
  const NoNetworkView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: ColoredBox(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                body: Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.noNetwork),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
