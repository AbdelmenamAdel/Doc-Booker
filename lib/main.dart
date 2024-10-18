import 'package:flutter/material.dart';
import 'package:markaz_elamal/core/common/screens/markaz_elamal.dart';

void main() {
  runApp(const MarkazElamal());
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          const SizedBox(
            height: 20,
          ),
          const Text('Markaz Elamal'),
        ],
      ),
    );
  }
}
